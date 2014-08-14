class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :invitations, foreign_key: "attendee_id"
  has_many :attended_events, through: :invitations

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates_format_of :email, with: /@/
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def upcoming_events
  	self.attended_events.upcoming
  end

  def past_events
  	self.attended_events.past
  end
end
