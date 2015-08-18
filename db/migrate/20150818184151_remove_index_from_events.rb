class RemoveIndexFromEvents < ActiveRecord::Migration
  def change
	remove_index :events, name: :index_events_on_date_and_time_and_creator_id
  end
end
