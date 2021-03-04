module UpcExceptions
  def record_not_found
    render json: {error: [t('errors.record_not_found')], success: false}, status: :not_found
  end

  def bad_request
    render json: {error: [t('errors.bad_request')], success: false}, status: :bad_request
  end

  def file_not_found
    render json: {error: [t('errors.file_not_found')], success: false}, status: :not_found
  end

  def invalid_foreign_key
    render json: {error: [t('errors.invalid_foreign_key')], success: false}, status: :unprocessable_entity
  end

  def forbidden
    render json: {error: [t('errors.forbidden')], success: false}, status: :forbidden
  end

  def user_not_authorized
    render json: { error: [t('errors.unauthorized')], success: false }, status: :forbidden
  end

  def failed_recaptcha
    render json: {success: false, error: {message: t('devise.failure.captcha_failed')}}, status: :unauthorized
  end
end