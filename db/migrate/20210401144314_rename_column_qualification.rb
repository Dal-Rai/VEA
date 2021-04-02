class RenameColumnQualification < ActiveRecord::Migration[5.0]
  def change
    rename_column  :qualifications, :highest_qualification, :level
  end
end
