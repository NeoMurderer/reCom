module API
  class Vkontakte
    include HTTParty
    base_uri 'https://api.vk.com'

    def get_token(code, redirect_uri)
      query = {
        code: code,
        client_id: Rails.application.secrets.vkontakte_client_id,
        client_secret: Rails.application.secrets.vkontakte_client_secret,
        redirect_uri: redirect_uri
      }
      response = HTTParty.get 'https://oauth.vk.com/access_token', query: query
      response.parsed_response
    end

    def get_songs(token, type = 'friend', q = nil)
      query = {
        'v' => '5.45',
        'access_token' => token
      }
      if q
        query.merge!({
          'owner_id' => q
          })
      end
      response = self.class.get('/method/audio.get', query: query).parsed_response
      response['response']['items']
    end

    def get_friends(token)
      query = {
        'v' => '5.45',
        'access_token' => token,
        'order' => 'name',
        'fields' => 'photo_50,first_name,last_name'
      }
      response = self.class.get('/method/friends.get', query: query).parsed_response
      response['response']['items']
    end
  end
end
