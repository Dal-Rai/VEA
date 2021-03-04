module Tokenizable
  extend ActiveSupport::Concern

  included do
    before_create :assign_token
    after_commit :update_token, on: :update

    def update_token
      unless self.previous_changes['encrypted_password'].nil?
        update(invitation_token: generate_token)
      end
    end

    def assign_token
      self.invitation_token = generate_token
    end

    def generate_token
      Devise::Encryptor.digest(self.class, invitation_token)
    end

    def jwt
      {
        token: ::JwtWrapper.encode(token: self.token), email: self.email,
        name: self.name, id: id,
        # roles: roles, is_active: is_active?, user_type: user_type,
        # salutation: salutation, phone: phone, mobile: mobile, gender: gender, pic: profile.avatar,
        # organization: send("#{user_type}_organization"),
        firstname: firstname, lastname: lastname,
        # role_toggle: current_role?,
        # current_role: current_role
      }
    end

    def roles
      sorted_roles.map { |user_role|
        {
          id: user_role.id,
          roleable_type: user_role.roleable_type,
          roleable_id: user_role.roleable_id,
          role: user_role.role,
          organization: user_role.roleable.name
        }
      }
    end

    def internal_organization
      { name: 'UPC Schweiz GmbH' , id: nil }
    end

    def external_organization
      { name: customer.name, id: customer.id }
    end
  end
end
