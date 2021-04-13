class RemoveColumnSubject < ActiveRecord::Migration[5.0]
  def change
    change_table :subjects do |t|
      t.remove_references :qualification
    end
  end
end
