class AddFacultyToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.belongs_to :faculty
    end
  end
end
