class CourseCategory < ApplicationRecord
  has_many :courses, inverse_of: :course_category
  has_many :category_preferances, inverse_of: :course_category
end