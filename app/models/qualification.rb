class Qualification < ApplicationRecord
  validates_presence_of :overall_percentage
  belongs_to :user, inverse_of: :qualifications

  enum highest_qualification: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}
end