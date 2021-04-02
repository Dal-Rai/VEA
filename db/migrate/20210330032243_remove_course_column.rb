class RemoveCourseColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :qualifications, :subject, :json
  end
end
