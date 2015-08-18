class AddIndexToEvents < ActiveRecord::Migration
  def change
	add_index :events, [ :date, :start_time, :creator_id ], unique: true
  end
end
