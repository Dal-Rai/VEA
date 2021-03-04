class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :salutation
      t.string :firstname
      t.string :lastname
      t.string :designation
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
