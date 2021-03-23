class CreateSelectionCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :selection_criteria do |t|
      t.integer :university_id
      t.decimal :english_competency
      t.decimal :academic
      t.decimal :experience

      t.timestamps
    end
  end
end
