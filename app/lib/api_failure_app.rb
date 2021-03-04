class ApiFailureApp < Devise::FailureApp
  # over-riding default because we want nice looking error pages rather than redirects
  def respond
    http_auth
  end

  def http_auth
    self.status = 401
    self.headers["WWW-Authenticate"] = %(Bearer realm=#{Devise.http_authentication_realm.inspect}) if http_auth_header?
    self.content_type = 'application/json'
    self.response_body = http_auth_body
  end

  def http_auth_body
    { error: [i18n_message], success: false }.to_json
  end

  def request_format
    :json
  end
end