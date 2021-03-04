class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  include BCrypt
  before_action :generate_api_key, only: [:create]
  before_action :set_user, only: [:edit]
  before_action :get_tickets, only: [:edit, :update]

  def new
    @user = User.new
    @profile = @user.build_profile
    @company = @user.build_company
  end

  def edit
  end

  def create
    binding.pry
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    yield resource if block_given?
    if update_resource(resource, update_params)
      set_flash_message! :notice, :updated
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: home_index_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:users).permit(:email, :password, :password_confirmation,
                                 profile_attributes: [:salutation, :firstname, :lastname, :designation, :phone, :gender, :avatar],
                                 company_attributes: [:company_type, :name, :email, :phone, :website])
  end

  def update_params
    params.require(:users).permit(:email, :current_password, :password, :password_confirmation,
                                 profile_attributes: [:id, :salutation, :firstname, :lastname, :designation, :phone, :gender, :avatar])
  end

  def generate_api_key
    build_resource(sign_up_params)
    resource.role = :customer_admin
    resource.invitation_token = BCrypt::Password.create(params[:users][:password])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def get_tickets
    @ticketings = Ticketing.where.not(state: "archived")
  end
end
