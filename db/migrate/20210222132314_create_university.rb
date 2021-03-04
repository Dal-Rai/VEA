class CreateUniversity < ActiveRecord::Migration[5.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :weblink
      t.text :remark
      t.text :token

      t.timestamps
    end
  end
end
