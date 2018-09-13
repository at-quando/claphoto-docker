class SignaturesController < ApplicationController
  def index
  end

  def create
    @contract = Contract.find_by(code: params[:code])
    if @contract.update_attributes(sign: params[:sign])
      redirect_to contract_path(@contract)
    else
      redirect_to signatures_path
      flash[:alert] = 'Maybe your photos are not completed or invalid!'
    end
  end
end
