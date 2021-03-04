class JwtWrapper
  class << self
    def encode(payload, expiration=24.hours.from_now)
      expiration ||= Rails.application.secrets.jwt_expiration_hours
      payload[:exp] = expiration.to_i
      JWT.encode payload, Rails.application.secrets.jwt_secret
    end

    def decode(token)
      decoded_token = JWT.decode token, Rails.application.secrets.jwt_secret
      decoded_token.first
    rescue
      nil
    end

  end
end