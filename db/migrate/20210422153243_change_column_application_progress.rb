class ChangeColumnApplicationProgress < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:application_progresses, :state, from: 0, to: 1)
  end
end
