class EventController < ApplicationController
  def fire
    return nil unless current_user
    event = params[:event]
    ActionCable.server.broadcast "user_#{current_user.id}", {event: event[:action], data: params[:data],platform:event[:platform]}
  end
end
