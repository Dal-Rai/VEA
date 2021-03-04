class ApplicationController < ActionController::Base
  include Pundit

  #protect_from_forgery with: :exception
  #before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    home_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private
  def user_not_authorized
    redirect_to (request.referrer || root_path), alert: t('devise.passwords.not_authorized')
  end
end
