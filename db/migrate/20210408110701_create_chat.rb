class CreateChat < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.belongs_to :chatable
      t.string :chatable_type
      t.belongs_to :user
      t.text :message

      t.timestamps
    end
  end
end
