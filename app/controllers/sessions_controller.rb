class SessionsController < ApplicationController
  def create
    if params['token']
      @token = AuthenticationService.mobile_token(params)
    else
      @token = AuthenticationService.token(params)
    end

  end
end
