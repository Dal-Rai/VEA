class AddColumnToCourseUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :course_units, :category, :integer, default: 0
  end
end
