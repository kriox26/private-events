class RemoveDateFromEvents < ActiveRecord::Migration
  def change
	remove_column :events, :date, :datetime
  end
end
