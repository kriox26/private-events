class ChangeStartTimeOnEvents < ActiveRecord::Migration
  def up
	change_column :events, :start_time, :string
  end

  def down
   change_column :events, :start_time, :time
  end
end
