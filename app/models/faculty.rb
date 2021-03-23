class Faculty < ApplicationRecord
  validates_presence_of :name, :code, :university_id
  belongs_to :university, inverse_of: :faculties
  has_many :courses, inverse_of: :faculty
end