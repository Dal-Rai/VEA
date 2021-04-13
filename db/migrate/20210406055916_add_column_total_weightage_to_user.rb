class AddColumnTotalWeightageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_weightage, :decimal, default: 0
  end
end
