class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user

  def layout
    render 'layouts/application', layout: false
  end

  private

  def current_user
    token = request.headers.fetch(:authorization,nil).try(:split," ").try(:last)
    AuthenticationService.user(token)
  end
end
