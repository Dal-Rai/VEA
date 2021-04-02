class SessionsController <  Devise::SessionsController
  # Api Sessions Controller inherits from the default Devise Sessions Controller
  # but with the catch. The API only expects data in json format
  #append_before_filter :verify_recaptcha!, only: [:create]

  # POST /users/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)

    if self.resource.uni_admin?
      if self.resource.university.activated?
       redirect_to(controller: :users, action: :show, id: self.resource.id)
      else
        sign_out self.resource
       redirect_to new_user_session_path, danger: 'Please upgrade your membership'
     end
    else
      redirect_to(controller: :users, action: :show, id: self.resource.id)
    end

  end

  def new; end
end