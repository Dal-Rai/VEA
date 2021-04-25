class AddColumnEnrollToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :enroll, default: false
    end
  end
end
