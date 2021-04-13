class CreateCriteriaRule < ActiveRecord::Migration[5.0]
  def change
    create_table :criteria_rules do |t|
      t.belongs_to :university
      t.integer :criteria
      t.decimal :weightage
      t.text :description

      t.timestamps
    end
  end
end
