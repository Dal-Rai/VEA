class ChangeDefaultValueAddress < ActiveRecord::Migration[5.0]
  def change
    change_column_null :addresses, :street_no, true
    change_column_null :addresses, :suburb, true
    change_column_null :addresses, :post_code, true
  end
end
