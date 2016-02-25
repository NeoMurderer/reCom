class EventController < ApplicationController
  def fire
    return nil unless current_user
    ActionCable.server.broadcast "user_#{current_user.id}", {event: params[:event], data: params[:data]}
  end
end
