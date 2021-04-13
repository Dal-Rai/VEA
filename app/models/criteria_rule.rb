class CriteriaRule < ApplicationRecord
  validates_presence_of :university_id, :criteria, :weightage
  belongs_to :university, inverse_of: :criteria_rules

  enum criteria: {english: 0, academic: 1, experience: 2, country: 3}
end