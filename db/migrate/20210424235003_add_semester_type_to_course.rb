class AddSemesterTypeToCourse < ActiveRecord::Migration[5.0]
  def change
    change_table :courses do |t|
      t.integer :semester_type, default: 0
    end
  end
end
