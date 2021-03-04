class SessionsController <  Devise::SessionsController
  # Api Sessions Controller inherits from the default Devise Sessions Controller
  # but with the catch. The API only expects data in json format
  #append_before_filter :verify_recaptcha!, only: [:create]

  # POST /users/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    redirect_to(controller: self.resource.user_type.to_sym, action: :show, id: self.resource.id)
    # render json: { user: resource.jwt }, status: :ok
  end

  def new; end
end