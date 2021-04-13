class Experience < ApplicationRecord
  validates_presence_of :job_type
  belongs_to :user, inverse_of: :experiences

  def total_experience
    ((self.end-self.start)/1.year).round(2)
  end
end