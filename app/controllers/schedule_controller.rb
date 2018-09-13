class ScheduleController < ApplicationController
  def index
    uri   = URI.parse(request.fullpath)
    @check = false
    if uri.query
      params = CGI.parse(uri.query)
      token  = params['token'].first
      if AdminSecret.find_by(token_secret: token)
        @check = true
      end
    end
    @contracts = Contract.all.order(taken_date: :desc).group_by(&:taken_date)
    @contracts_bonus = Contract.all.order(taken_date_2: :desc).group_by(&:taken_date_2)
  end
end
