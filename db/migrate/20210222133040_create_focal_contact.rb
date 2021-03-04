class CreateFocalContact < ActiveRecord::Migration[5.0]
  def change
    create_table :focal_contacts do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :gender
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
