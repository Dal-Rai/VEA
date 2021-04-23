require 'elasticsearch/model'
class University < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :name, :weblink

  has_one :focal_contact, inverse_of: :university, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_one :selection_criteria, inverse_of: :university, dependent: :destroy
  has_one :wallet, as: :payee, dependent: :destroy
  has_many :users, inverse_of: :university, dependent: :destroy
  has_many :faculties, inverse_of: :university, dependent: :destroy
  has_many :courses, through: :faculties
  has_many :english_competencies, as: :competenciable, dependent: :destroy
  has_many :academic_eligibilities, as: :eligiable, dependent: :destroy
  has_many :country_criterias, inverse_of: :university, dependent: :destroy
  has_many :criteria_rules, inverse_of: :university, dependent: :destroy
  has_one :experience_criteria, inverse_of: :university, dependent: :destroy
  has_many :qualification_criterias, inverse_of: :university, dependent: :destroy
  has_one :membership, as: :memberable, dependent: :destroy

  accepts_nested_attributes_for(
  :focal_contact,
    :address,
    :english_competencies,
    :academic_eligibilities,
    allow_destroy: true
  )

  before_create :assign_token
  after_create :notify_portal_admin

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :remark, type: :text
    end
  end

  def search_detail
    "#{name} has #{faculties.count} departments"
  end

  def assign_token
    self.token = Devise.token_generator.generate(self.class, :token).second
  end

  def notify_portal_admin
    UniversityMailer.notify_portal_admin(self).deliver_now
  end

  def english_competencies
    return super unless super.empty?
    super.build(
      [{
        competency_type: :IELTS,
        overall_band: 6.5,
        speaking: 6.0,
        writing: 6.0,
        reading: 6.0,
        listening: 6.0
       },
      {
        competency_type: :PTE,
        overall_band: 6.5,
        speaking: 6.0,
        writing: 6.0,
        reading: 6.0,
        listening: 6.0
      }]
    )
  end

  def academic_eligibilities
    return super unless super.empty?
    super.build(
           [
             { eligibility_type: 'Post Graduate', minimum_score: 60, code: 'PG' },
             { eligibility_type: 'Under Graduate', minimum_score: 60, code: 'UG'},
             { eligibility_type: 'Diploma', minimum_score: 60, code: 'DIP' },
             { eligibility_type: 'Certificate Or High School', minimum_score: 60, code: 'HS' }
           ]
    )
  end

  def activated?
    return false if wallet.nil?
    wallet.end_date > DateTime.now
  end

  def experience_criteria
    super.nil? ? self.build_experience_criteria : super
  end

  def address
    super || self.build_address
  end

end
