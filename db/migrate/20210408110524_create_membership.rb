class CreateMembership < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :memberable
      t.string :memberable_type
      t.belongs_to :package

      t.timestamps
    end
  end
end
