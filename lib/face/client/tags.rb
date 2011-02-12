module Face
  module Client
    module Tags
      def tags_get(opts={})
        make_request(:tags_get, opts.merge(user_auth_param))
      end

      def tags_add(opts={})
        make_request(:tags_add, opts.merge(user_auth_param))
      end

      def tags_save(opts={})
        make_request(:tags_save, opts.merge(user_auth_param))
      end

      def tags_remove(opts={})
        make_request(:tags_remove, opts.merge(user_auth_param))
      end
    end
  end
end