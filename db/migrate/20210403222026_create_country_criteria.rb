class CreateCountryCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :country_criteria do |t|
      t.belongs_to :university
      t.string :country
      t.decimal :weightage
      t.text :description

      t.timestamps
    end
  end
end
