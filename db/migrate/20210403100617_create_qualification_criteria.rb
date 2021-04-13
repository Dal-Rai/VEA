class CreateQualificationCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :qualification_criteria do |t|
      t.belongs_to :university
      t.integer :qualification_type
      t.decimal :weightage
      t.text :description

      t.timestamps
    end
  end
end
