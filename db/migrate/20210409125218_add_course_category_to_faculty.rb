class AddCourseCategoryToFaculty < ActiveRecord::Migration[5.0]
  def change
    change_table :faculties do |t|
      t.belongs_to :course_category
    end
  end
end
