class AddColumnSubject < ActiveRecord::Migration[5.0]
  def change
    change_table :subjects do |t|
      t.belongs_to :subjectable
      t.string :subjectable_type
    end
  end
end
