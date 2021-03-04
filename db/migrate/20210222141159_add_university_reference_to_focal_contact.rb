class AddUniversityReferenceToFocalContact < ActiveRecord::Migration[5.0]
  def change
    add_column :focal_contacts, :university_id, :integer
  end
end
