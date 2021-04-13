class AddColumnToExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :related, :boolean, default: true
  end
end
