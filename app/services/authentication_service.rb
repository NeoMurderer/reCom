class AuthenticationService
  def self.token(params)
    code = params.fetch('code')
    client_id = params.fetch('clientId')
    redirect_uri = params.fetch('redirectUri')
    vk_response = API::Vkontakte.new.get_token(code, redirect_uri)

    user = User.find_by_vkontakte_id vk_response['user_id']

    if user
      user.update_attributes access_token: vk_response['access_token']
    else
      user = User.create vkontakte_id: vk_response['user_id'], access_token: vk_response['access_token']
    end

    payload = { iss: user.id }
    JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
  end

  def self.user(token)
    return nil unless token
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base, { :algorithm => 'HS256' }).first
    User.find(payload['iss'])
  end
end
