class CreatePackage < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.integer :package_type
      t.decimal :amount
      t.integer :duration
      t.integer :payee

      t.timestamps
    end
  end
end
