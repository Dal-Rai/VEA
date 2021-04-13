class AddColumnToUniversity < ActiveRecord::Migration[5.0]
  def change
    add_column :universities, :campus, :string
    add_column :universities, :semester_living_expenses, :decimal, default: 0
  end
end
