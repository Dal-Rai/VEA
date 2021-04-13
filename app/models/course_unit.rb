class CourseUnit < ApplicationRecord
  validates_presence_of :course_id, :unit_id
  belongs_to :course, inverse_of: :course_units
  belongs_to :unit, inverse_of: :course_units
  enum category: {optional: 0, mendatory: 1}
end