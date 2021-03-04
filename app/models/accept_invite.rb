class AcceptInvite
  include ActiveModel::Validations

  attr_accessor :password, :password_confirmation, :invitation_token, :resource, :user, :errors

  validates_presence_of :password, :password_confirmation, :invitation_token
  validate :invitation_token_valid, :password_and_confirmation_are_same

  def initialize(attributes={})
    @errors = ActiveModel::Errors.new(self)
    update_attributes(attributes)
  end

  def update_attributes(attributes)
    attributes.each do |key, value|
      writer_method = "#{key}="
      send(writer_method, value) if respond_to?(writer_method)
    end
  end

  def save
    return false if invalid?
    ActiveRecord::Base.transaction do
      user.update!(
        password: password,
        password_confirmation: password_confirmation,
        is_active: true
      )

      user.accept_invitation!
    end
  end

  private

  def invitation_token_valid
    @user = User.find_by(invitation_token: invitation_token)
    errors.add(:invitation_token, 'Invalid invitation token') unless @user
  end

  def password_and_confirmation_are_same
    unless password.eql?(password_confirmation)
      errors.add(:password_confirmation, I18n.t('invitation.errors.password_mismatch'))
    end
  end
end