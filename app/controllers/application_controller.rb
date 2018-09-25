class ApplicationController < ActionController::Base
  def response_headers(access_token, provider, uid)
    response.headers['Access-Token'] = access_token
    response.headers['Uid'] = uid
    response.headers['Provider'] = provider
  end

  def request_headers
    [request.headers['Access-Token'], request.headers['Provider'], request.headers['Uid']]
  end
end
