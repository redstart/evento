class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :registrations, foreign_key: "attendee_id"
  has_many :attended_events, through: :registrations

  # validates :username, presence: true

  def upcoming_events
  	self.attended_events.upcoming
  end

  def past_events
  	self.attended_events.past
  end

  def attending?(event)
    event.attendees.include?(self)
  end
end
