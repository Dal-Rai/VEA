class CategoryPreferance < ApplicationRecord
  belongs_to :user, inverse_of: :category_preferances
  belongs_to :course_category, inverse_of: :category_preferances
end