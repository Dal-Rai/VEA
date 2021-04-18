class AddQualificationColumnToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :recent_qualification, default: 5
    end
  end
end
