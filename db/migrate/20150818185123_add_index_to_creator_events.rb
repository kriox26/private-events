class AddIndexToCreatorEvents < ActiveRecord::Migration
  def change
	add_index :events, [ :creator_id , :date ], unique: true
  end
end
