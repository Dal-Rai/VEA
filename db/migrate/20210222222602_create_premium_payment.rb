class CreatePremiumPayment < ActiveRecord::Migration[5.0]
  def change
    create_table :premium_payments do |t|
      t.datetime :end_date
      t.datetime :start_date
      t.integer :payable_id
      t.string :payable_type
      t.string :pay_type
      t.float :amount

      t.timestamps
    end
  end
end
