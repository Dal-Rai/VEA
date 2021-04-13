class AddColumnToUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :semester_fees, :decimal, default: 0
  end
end
