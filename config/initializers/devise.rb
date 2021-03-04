# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'vea@gmail.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11

  config.mailer = 'UserMailer'

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.maximum_attempts = 10
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.reset_password_within = 1.day
  config.sign_out_via = :delete

  config.warden do |manager|
    manager.strategies.add(:jwt, Devise::Strategies::JwtAuthentication)
    manager.default_strategies(:scope => :user).unshift :jwt
    #manager.failure_app = ApiFailureApp
  end

  config.invite_for = 1.week
  config.validate_on_invite = true
end
