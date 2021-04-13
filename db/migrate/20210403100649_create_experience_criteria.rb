class CreateExperienceCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_criteria do |t|
      t.belongs_to :university
      t.decimal :related_experience
      t.decimal :unrelated_experience
      t.text :description

      t.timestamps
    end
  end
end
