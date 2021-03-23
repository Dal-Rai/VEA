class AddColumnToEnglishCompetency < ActiveRecord::Migration[5.0]
  def change
    add_column :english_competencies, :competenciable_id, :integer
    add_column :english_competencies, :competenciable_type, :string
    remove_column :english_competencies, :user_id
  end
end
