class AddColumnToPaypalCart < ActiveRecord::Migration[5.0]
  def change
    add_column :paypal_carts, :end_date, :date
  end
end
