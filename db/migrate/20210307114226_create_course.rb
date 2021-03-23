class CreateCourse < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.integer :duration
      t.integer :rank
      t.integer :faculty_id

      t.timestamps
    end
  end
end
