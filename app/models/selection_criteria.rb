class SelectionCriteria < ApplicationRecord
  belongs_to :university, inverse_of: :selection_criteria
end