module Face
  module Client
    module Recognition
      def faces_detect(opts={})
        opts.assert_valid_keys(:urls, :file, :detector, :attributes, :callback, :callback_url)
        make_request(:faces_detect, opts)
      end

      def faces_group(opts={})
        opts.assert_valid_keys(:urls, :file, :detector, :attributes, :callback, :callback_url)
        make_request(:faces_group, opts)
      end

      def faces_recognize(opts={})
        opts.assert_valid_keys(:uids, :urls, :namespace, :detector, :attributes, :callback, :callback_url)
        make_request(:faces_recognize, opts.merge(user_auth_param))
      end

      def faces_train(opts={})
        opts.assert_valid_keys(:uids, :namespace, :callback, :callback_url)
        make_request(:faces_train, opts.merge(user_auth_param))
      end

      def faces_status(opts={})
        opts.assert_valid_keys(:uids, :namespace, :callback, :callback_url)
        make_request(:faces_status, opts.merge(user_auth_param))
      end
    end
  end
end