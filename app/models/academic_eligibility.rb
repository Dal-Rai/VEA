class AcademicEligibility < ApplicationRecord
  validates_presence_of :eligibility_type, :minimum_score
  belongs_to :university, inverse_of: :academic_eligibilities
  default_scope -> { order(code: :asc) }

  enum code: { PG: 0, UG: 1, DIP: 2, HS: 3 }
end