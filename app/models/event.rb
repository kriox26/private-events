class Event < ActiveRecord::Base
  self.per_page = 15

  # Associations
  belongs_to :creator,   class_name: "User"
  has_many 	 :invites,   foreign_key: :attended_event_id
  has_many 	 :attendees, through: :invites

end
