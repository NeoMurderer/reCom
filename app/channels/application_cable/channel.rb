# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def message(data)
      Rails.logger.debug "HELLO_MESSAGE"
    end
  end
end
