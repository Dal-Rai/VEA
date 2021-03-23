class Experience < ApplicationRecord
  validates_presence_of :job_type
  belongs_to :user, inverse_of: :experiences
end