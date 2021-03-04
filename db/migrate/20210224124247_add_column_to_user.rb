class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token, :string
    add_column :users, :user_type, :integer
    add_column :users, :is_active, :boolean, default: false

  end
end
