class SongsController < ApplicationController
  def index
    vk = API::Vkontakte.new
    @songs = case params[:type]
    when /friend|group/
      vk.get_songs(current_user.access_token, params[:type], params[:query])
    else
      vk.get_songs(current_user.access_token)
    end
  end
end
