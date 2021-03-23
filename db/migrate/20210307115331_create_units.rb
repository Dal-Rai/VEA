class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :code
      t.string :name
      t.integer :credit_point
      t.integer :level

      t.timestamps
    end
  end
end
