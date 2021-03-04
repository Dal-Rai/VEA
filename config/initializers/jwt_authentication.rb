require 'devise/strategies/database_authenticatable'

module Devise
  module Strategies
    class JwtAuthentication < DatabaseAuthenticatable
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        return fail!('missing claim or invalid claim supplied') unless claims
        return fail!('token missing inside claims') unless claims.has_key?('token')
        resource = mapping.to.find_for_database_authentication(:token => claims['token'])
        success! resource
      end

      protected
      def claims
        strategy, token = request.headers['Authorization'].split(' ')
        return nil if (strategy || '').downcase != 'bearer'
        JwtWrapper.decode(token) rescue nil
      end
    end
  end
end

Warden::Strategies.add(:jwt, Devise::Strategies::JwtAuthentication)
