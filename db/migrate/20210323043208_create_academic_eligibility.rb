class CreateAcademicEligibility < ActiveRecord::Migration[5.0]
  def change
    create_table :academic_eligibilities do |t|
      t.integer :eligiable_id
      t.string :eligiable_type
      t.string :eligibility_type
      t.decimal :minimum_score
      t.integer :code

      t.timestamps
    end
  end
end
