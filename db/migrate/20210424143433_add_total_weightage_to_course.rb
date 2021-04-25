class AddTotalWeightageToCourse < ActiveRecord::Migration[5.0]
  def change
    change_table :courses do |t|
      t.decimal :total_weightage
    end
  end
end
