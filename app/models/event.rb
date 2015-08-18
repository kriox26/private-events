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
  validates :date, presence: true
  validates :event_cant_be_in_the_past


  # Validations
  private
	def event_cant_be_in_the_past
	  self.errors.add(:date, 'Event cant be in the past') if !date.blank? && date > Time.now
	end

end
