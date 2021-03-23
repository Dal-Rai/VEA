class CreateFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :faculties do |t|
      t.string :code
      t.string :name
      t.integer :university_id

      t.timestamps
    end
  end
end
