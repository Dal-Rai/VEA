class AddUniversityToUnit < ActiveRecord::Migration[5.0]
  def change
    change_table :units do |t|
      t.belongs_to :university
    end
  end
end
