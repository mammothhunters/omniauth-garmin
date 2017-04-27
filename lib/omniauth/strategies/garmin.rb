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
          :access_token_url   => 'https://connectapitest.garmin.com/oauth-service-1.0/oauth/access_token',
      }

      def request_phase # Overriding to force oauth_callback to be included (for dev / test environments)
        request_token = consumer.get_request_token({:oauth_callback => callback_url}, options.request_params)
        session["oauth"] ||= {}
        session["oauth"][name.to_s] = {"callback_confirmed" => request_token.callback_confirmed?, "request_token" => request_token.token, "request_secret" => request_token.secret}

        redirect request_token.authorize_url(options[:authorize_params].merge(:oauth_callback => callback_url))

      rescue ::Timeout::Error => e
        fail!(:timeout, e)
      rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
        fail!(:service_unavailable, e)
      end

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid do
        access_token.token
      end

      info do
        {

        }
      end

      def raw_info
        access_token
      end
    end
  end
end