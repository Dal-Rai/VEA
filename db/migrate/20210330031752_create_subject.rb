class CreateSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.decimal :percentage, default: 0
      t.belongs_to :qualification

      t.timestamps
    end
  end
end
