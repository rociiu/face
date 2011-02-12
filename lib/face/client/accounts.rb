module Face
  module Client
    module Accounts
      def account_limits(opts={})
        make_request(:tags_remove, opts.merge(user_auth_param))
      end

      def account_users(opts={})
        make_request(:account_users, opts.merge(user_auth_param))
      end
    end
  end
end