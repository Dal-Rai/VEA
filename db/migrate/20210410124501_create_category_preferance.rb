class CreateCategoryPreferance < ActiveRecord::Migration[5.0]
  def change
    create_table :category_preferances do |t|
        t.belongs_to :course_category
        t.belongs_to :user

        t.timestamps
    end
  end
end
