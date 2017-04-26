require 'json'
require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Garmin < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "garmin"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
          :site               => 'https://connectapitest.garmin.com',
          :authorize_url      => 'https://connecttest.garmin.com/oauthConfirm',
          :request_token_url  => 'https://connectapitest.garmin.com/oauth-service-1.0/oauth/request_token',
          :access_token_url   => 'https://connectapitest.garmin.com/oauth-service-1.0/oauth/access_token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid do
        ap raw_info
        nil
      end

      info do
        ap "HELLO"
        nil
      end

      def raw_info
        ap access_token + " in raw info"
        access_token
      end
    end
  end
end