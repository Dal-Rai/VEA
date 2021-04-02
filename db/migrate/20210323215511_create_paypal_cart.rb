class CreatePaypalCart < ActiveRecord::Migration[5.0]
  def change
    create_table :paypal_carts do |t|
      t.string :token, allow_nil: false
      t.decimal :amount, default: 0
      t.belongs_to :user
      t.belongs_to :wallet

      t.timestamps
    end
  end
end
