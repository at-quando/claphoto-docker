class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
  end

  def show
    @photographer = Photographer.find(params[:id])
    uri   = URI.parse(request.fullpath)
    @status = ''
    @check = false
    if uri.query
      params = CGI.parse(uri.query)
      @status  = params['status'].first
      if @status == "unpaid"
        @shows = @photographer.contract_photographers.where(paid: false).joins(:contract).order('contracts.taken_date DESC')
      else
        @shows = @photographer.contract_photographers.joins(:contract).order('contracts.taken_date DESC')
      end
      token  = params['token'].first
      if AdminSecret.find_by(token_secret: token)
        @check = true
      end
    else
      @shows = @photographer.contract_photographers.joins(:contract).order('contracts.taken_date DESC')
    end
  end

  def update
    @photographer = ContractPhotographer.find(params[:id])
    if !@photographer.paid
      @photographer.update_attributes(paid: true)
    end
    redirect_to request.referrer, notice: "You're being redirected"
  end

  def payall
    @contract_pay = Photographer.find(params[:id]).contract_photographers
    @contract_pay.each do |pay|
      if !pay.paid
        pay.update_attributes(paid: true)
      end
    end
    redirect_to request.referrer, notice: "You're being redirected"
  end
end
