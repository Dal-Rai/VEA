class CourseCategory < ApplicationRecord
  has_many :courses, inverse_of: :course_category
  has_many :category_preferances, inverse_of: :course_category
  has_many :application_progresses, through: :courses

  default_scope -> { order(name: :asc) }
end