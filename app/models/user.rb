class User < ActiveRecord::Base

	has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
	has_many :invitations, foreign_key: "attendee_id"
	has_many :attended_events, through: :invitations
	has_attached_file :avatar, styles: { avatar: "100x100", small: "50x50>" }, default_url: "missing_:style.png"

	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, with: /@/
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def upcoming_events
		self.attended_events.upcoming
	end

	def past_events
		self.attended_events.past
	end
end
