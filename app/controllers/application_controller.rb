class ApplicationController < ActionController::Base
  include Pundit
  # include TacTucExceptions
  include CommonHelpers
  # include Pagination
  # include Renderer
  before_action :clear_flash
  add_flash_types :danger, :info, :success, :warning

  rescue_from ArgumentError, with: :argument_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::ParameterMissing, with: :bad_request
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def after_sign_in_path_for(resource_or_scope)
  #   binding.pry
  #   home_index_path
  # end
  #
  # def after_sign_out_path_for(resource_or_scope)
  #   binding.pry
  #   new_user_session_path
  # end
 def clear_flash
   flash.clear
 end



  protected
  def authorize_record(record)
    authorize record
  end

  private

  def argument_error(error)
    @error = error
    argument_error!(error)
  end
end
