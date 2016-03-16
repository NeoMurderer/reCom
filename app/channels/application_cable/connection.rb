# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      token = request.params[:token]
      self.current_user = AuthenticationService.user(token)

      Rails.logger.debug self.current_user.as_json
    end

    def disconnect
      # Any cleanup work needed when the cable connection is cut.
    end

  end
end
