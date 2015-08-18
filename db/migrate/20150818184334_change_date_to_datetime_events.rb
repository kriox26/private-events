class ChangeDateToDatetimeEvents < ActiveRecord::Migration
  def up
	change_column :events, :date, :datetime
  end

  def down
   change_column :events, :date, :date
  end
end
