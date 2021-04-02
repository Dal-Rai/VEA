class Subject < ApplicationRecord
  belongs_to :qualification, inverse_of: :subjects
end