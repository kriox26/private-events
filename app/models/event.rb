class Event < ActiveRecord::Base
  # Associations
  belongs_to :creator, class_name: "User"
end
