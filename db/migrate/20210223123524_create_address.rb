class CreateAddress < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :street_no, null: false
      t.string :street_name
      t.string :suburb, null: false
      t.string :post_code, null: false
      t.string :city
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
