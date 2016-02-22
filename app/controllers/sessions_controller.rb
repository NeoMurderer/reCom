class SessionsController < ApplicationController
  def create
    @token = AuthenticationService.token(params)
  end
end
