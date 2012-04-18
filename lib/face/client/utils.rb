module Face
  module Client
    module Utils

      class FaceError < StandardError; end

      API_METHODS = {
        :faces_detect => 'https://api.face.com/faces/detect.json',
        :faces_recognize => 'https://api.face.com/faces/recognize.json',
        :faces_train => 'https://api.face.com/faces/train.json',
        :faces_status => 'https://api.face.com/faces/status.json',
        :tags_get => 'https://api.face.com/tags/get.json',
        :tags_add => 'https://api.face.com/tags/add.json',
        :tags_save => 'https://api.face.com/tags/save.json',
        :tags_remove => 'https://api.face.com/tags/remove.json',
        :account_limits => 'https://api.face.com/account/limits.json',
        :account_users => 'https://api.face.com/account/users.json'
      }

      def api_crendential
        { :api_key => api_key, :api_secret => api_secret }
      end

      def make_request(api_method, opts={})
        if opts[:urls].is_a? Array
          opts[:urls] = opts[:urls].join(',')
        end

        if opts[:uids].is_a? Array
          opts[:uids] = opts[:uids].join(',')
        end
        response = JSON.parse( RestClient.post(API_METHODS[ api_method ], opts.merge(api_crendential)).body )
        if %w/success partial/.include?(response['status'])
          response
        elsif response['status'] == 'failure'
          raise FaceError.new("Error: #{response['error_code']}, #{response['error_message']}")
        end
      end

      def user_auth_param
        user_auth_value = []
        if twitter_credentials
          twitter_credentials.each do |k, v|
            user_auth_value << "#{k}:#{v}"
          end
        elsif twitter_oauth_credentials
          twitter_oauth_credentials.each do |k,v|
            user_auth_value << "#{k}:#{v}"
          end
        end
        if facebook_credentials
          facebook_credentials.each do |k, v|
            user_auth_value << "#{k}:#{v}"
          end
        end
        user_auth_value.size > 0 ? { :user_auth => user_auth_value.join(',') } : {}
      end

    end
  end
end