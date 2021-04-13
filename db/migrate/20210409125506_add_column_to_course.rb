class AddColumnToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :total_fees, :decimal, default: 0
  end
end
