class GroupsController < ApplicationController
  def index
    vk = API::Vkontakte.new
    @groups = vk.get_groups(current_user.access_token)
  end
end
