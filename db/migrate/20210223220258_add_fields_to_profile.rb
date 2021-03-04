class AddFieldsToProfile < ActiveRecord::Migration[5.0]
  def change
      change_table :profiles do |t|
        t.attachment :avatar
    end
  end
end
