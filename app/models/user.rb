class User < ApplicationRecord
  include Tokenizable
  include Profileable
  include CourseLooker
  include Recommendation
  include WeightageCalculator
  include ProspectiveStudentHelper

  validates_presence_of :email, :password, on: :create
  devise :invitable, :database_authenticatable, :registerable, :lockable,
    :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates_uniqueness_of :email
  validate :password_strength

  has_one :profile, inverse_of: :user, dependent: :destroy
  belongs_to :university, inverse_of: :users, optional: true
  belongs_to :faculty, inverse_of: :users, optional: true
  has_one :address, as: :addressable, dependent: :destroy
  has_many :english_competencies, as: :competenciable, dependent: :destroy
  has_one :highest_english_competency, as: :competenciable, class_name: 'EnglishCompetency'
  has_many :qualifications, inverse_of: :user, dependent: :destroy
  has_many :subjects, through: :qualifications
  has_many :experiences, inverse_of: :user, dependent: :destroy
  has_one :wallet, as: :payee, dependent: :destroy
  has_many :paypal_carts, inverse_of: :user, dependent: :destroy
  has_one  :highest_qualification, :class_name=> "Qualification"
  has_many :chats, inverse_of: :user
  has_many :category_preferances, inverse_of: :user
  has_many :application_progresses, inverse_of: :user
  has_one :membership, as: :memberable, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :english_competencies, allow_destroy: true
  accepts_nested_attributes_for :qualifications, allow_destroy: true
  accepts_nested_attributes_for :experiences, allow_destroy: true

  enum user_type: {portal_admin: 0, uni_admin: 1, student: 2}
  enum recent_qualification: { high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4, other: 5}

  after_create :send_invitation

  delegate :name, to: :university, prefix: true, allow_nil: :true
  delegate :salutation, :firstname, :lastname, to: :profile, allow_nil: :false
  delegate :country, to: :address, prefix: false, allow_nil: :true

  paginates_per 10

  def pic
    profile&.avatar&.url || '/default_photo/photo.png'
  end

  def name
    full_name = "#{profile&.firstname} #{profile&.middlename} #{profile&.lastname}"
    full_name.blank? ? email : full_name
  end

  def send_invitation
    self.invite!
  end

  def highest_qualification_id
    highest_qualification&.id
  end

  private

  def password_strength
    if password && !(password.match(/(?=.*\d)(?=.*[A-Z])/))
      errors.add(:password, I18n.t('devise.passwords.invalid_password'))
    end
  end
end
