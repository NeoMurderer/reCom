class FriendsController < ApplicationController
  def index
    vk = API::Vkontakte.new
    @friends = vk.get_friends(current_user.access_token)
  end
end
