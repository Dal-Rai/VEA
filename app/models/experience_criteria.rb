class ExperienceCriteria < ApplicationRecord
  belongs_to :university, inverse_of: :experience_criteria
end