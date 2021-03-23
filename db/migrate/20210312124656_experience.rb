class Experience < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :job_type
      t.datetime :start
      t.datetime :end
      t.string :company
      t.text :responsibility

      t.timestamps
    end
  end
end
