class CreateWallet < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.integer :payee_id
      t.string :payee_type
      t.decimal :amount, default: 0
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
