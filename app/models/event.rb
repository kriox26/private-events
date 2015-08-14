class Event < ActiveRecord::Base
  self.per_page = 15

  # Associations
  belongs_to :creator, class_name: "User"

end
