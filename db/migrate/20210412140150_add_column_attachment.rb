class AddColumnAttachment < ActiveRecord::Migration[5.0]
  def change
    change_table :attachments do |t|
      t.attachment :file
      t.string :name
    end
  end
end
