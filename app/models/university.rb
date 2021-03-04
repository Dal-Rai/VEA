class University < ApplicationRecord
  validates_presence_of :name, :weblink

  has_one :focal_contact, inverse_of: :university, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many :users, inverse_of: :university, dependent: :destroy

  accepts_nested_attributes_for :focal_contact, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  before_create :assign_token
  after_commit :notify_portal_admin

  def assign_token
    self.token = Devise.token_generator.generate(self.class, :token).second
  end

  def notify_portal_admin
    UniversityMailer.notify_portal_admin(self).deliver_now
  end

end
