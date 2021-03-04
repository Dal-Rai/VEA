class User < ApplicationRecord
  include Tokenizable
  include Profileable

  validates_presence_of :email, :password, on: :create
  devise :invitable, :database_authenticatable, :registerable, :lockable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  validate :password_strength

  has_one :profile, inverse_of: :user, dependent: :destroy
  belongs_to :university, inverse_of: :users, optional: true
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  enum user_type: {portal_admin: 0, uni_admin: 1, student: 2}

  after_create :send_invitation

  delegate :name, to: :company, prefix: true, allow_nil: :false
  delegate :salutation, :firstname, :lastname, to: :profile, allow_nil: :false

  paginates_per 10

  def pic
    profile&.avatar&.url || '/default_photo/photo.png'
  end

  def name
    full_name = "#{profile&.firstname} #{profile&.lastname}"
    full_name.blank? ? email : full_name
  end

  def send_invitation
    self.invite!
  end

  private

  def password_strength
    if password && !(password.match(/(?=.*\d)(?=.*[A-Z])/))
      errors.add(:password, I18n.t('devise.passwords.invalid_password'))
    end
  end
end
