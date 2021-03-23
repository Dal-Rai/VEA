class CreateEnglishCompetency < ActiveRecord::Migration[5.0]
  def change
    create_table :english_competencies do |t|
      t.integer :user_id
      t.integer :competency_type
      t.date :expiry
      t.decimal :overall_band
      t.decimal :speaking
      t.decimal :reading
      t.decimal :writing
      t.decimal :listening

      t.timestamps
    end
  end
end
