class Event < ActiveRecord::Base
  self.per_page = 15

  # Associations
  belongs_to :creator,   class_name: "User"
  has_many 	 :invites,   foreign_key: :attended_event_id
  has_many 	 :attendees, through: :invites

  # Validations
  validates :title, presence: true, length: { maximum: 50 }
  validates :location, presence: true
  validates :description, presence: true, length: { miminum: 30, maximum: 255 }
  validates_datetime :date, on_or_after: lambda { Date.current }

end
