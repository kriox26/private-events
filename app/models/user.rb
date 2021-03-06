class User < ActiveRecord::Base
  self.per_page = 16
  attr_accessor :remember_token

  # Associations
  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :invites, foreign_key: :attendee_id
  has_many :attended_events, through: :invites

  # Callbacks
  before_save :downcase_email

  # Validatons
  validates :name, presence: true, length: { minimum: 5 , maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: 	true , length: { maximum: 255 },
					format: 	{ with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }


  # Generates a digest for the given string
  def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
												  BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
  end

  # Generates a new token using base64 encryption
  def User.new_token
	SecureRandom.urlsafe_base64
  end

  # Remembers the given user
  def remember
	self.remember_token = User.new_token
	update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the users remember_token matches the database digest
  def authenticated?(token)
	digest = self.remember_digest
	return false if digest.nil?
	BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns user upcoming events
  def upcoming_events
	self.attended_events.to_a.select { |event| event.date > Time.zone.now }
  end

  # Returns all past events
  def past_events
	self.attended_events.to_a.select { |event| event.date < Time.zone.now }
  end

  # Forgets a user
  def forget
	update_attribute(:remember_digest, nil)
  end

  private

	# Converts email to all lowercase
	def downcase_email
	  self.email = email.downcase
	end

end
