class Qualification < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.integer :user_id
      t.integer :highest_qualification
      t.string :course
      t.decimal :overall_percentage
      t.json :subject, default: {}
      t.date :completed_year

      t.timestamps
    end
  end
end
