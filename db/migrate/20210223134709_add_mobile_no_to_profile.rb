class AddMobileNoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :mobile_no, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :middlename, :string
    add_column :profiles, :passport_no, :string
  end
end
