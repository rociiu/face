module Face
  module Client
    module Recognition
      # http://api.face.com/faces/detect.json
      def faces_detect(opts={})
        opts.assert_valid_keys(:urls)
        make_request(:faces_detect, opts)
      end

      def faces_recognize(opts={})
        opts.assert_valid_keys(:uids, :urls)
        make_request(:faces_recognize, opts.merge(user_auth_param))
      end

      def faces_train(opts={})
        opts.assert_valid_keys(:uids)
        make_request(:faces_train, opts.merge(user_auth_param))
      end

      def faces_status(opts={})
        make_request(:faces_status, opts.merge(user_auth_param))
      end
    end
  end
end