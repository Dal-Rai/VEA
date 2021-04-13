class CreateApplicationProgress < ActiveRecord::Migration[5.0]
  def change
    create_table :application_progresses do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.integer :state, default: 0
      t.text :applied_comment
      t.text :received_comment
      t.text :verified_comment
      t.text :accepted_comment
      t.text :rejected_comment

      t.timestamps
    end
  end
end
