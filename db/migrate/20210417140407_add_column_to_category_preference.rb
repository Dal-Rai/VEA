class AddColumnToCategoryPreference < ActiveRecord::Migration[5.0]
  def change
    change_table :category_preferances do |t|
      t.decimal :fees, default: 0.0
    end
  end
end
