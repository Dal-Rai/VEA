class AcademicEligibility < ApplicationRecord
  validates_presence_of :eligibility_type, :minimum_score
  belongs_to :university, inverse_of: :academic_eligibilities
  default_scope -> { order(code: :asc) }

  enum code: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}
end