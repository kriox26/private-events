class ChangeStartTimeNameOnEvents < ActiveRecord::Migration
  def change
	rename_column :events, :start_time, :time
  end
end
