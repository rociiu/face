require File.expand_path('../utils', __FILE__)
require File.expand_path('../recognition', __FILE__)
require File.expand_path('../tags', __FILE__)
require File.expand_path('../accounts', __FILE__)

module Face
  module Client
    class Base
      
      attr_accessor :api_key, :api_secret

      #{
      #  twitter_username => [twitter screen name]
      #  twitter_password => [twitter password]
      #}
      attr_accessor :twitter_credentials

      #{
      #  twitter_oauth_user => [twitter OAuth user]
      #  twitter_oauth_secret => [twitter OAuth secret]
      #  twitter_oauth_token => [twitter OAuth token]
      #}
      attr_accessor :twitter_oauth_credentials

      #{
      #  fb_user => [facebook user id]
      #  fb_session => [facebook session id]
      #  fb_oauth_token =>  [facebook oauth 2.0 access token]
      #}
      attr_accessor :facebook_credentials

      include Face::Client::Utils
      include Face::Client::Recognition
      include Face::Client::Tags
      include Face::Client::Accounts


      def initialize(opts={})
        opts.assert_valid_keys(:api_key, :api_secret)
        @api_key, @api_secret = opts[:api_key], opts[:api_secret]
      end

    end
  end
end