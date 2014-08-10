class Event < ActiveRecord::Base

	belongs_to :creator, class_name: "User"
	has_many :invitations, foreign_key: "attended_event_id"
	has_many :attendees, through: :invitations

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :date, presence: true
	validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image' }

	scope :past, -> { where("Date < ?", Date.today) }

	scope :upcoming, -> { where("Date >= ?", Date.today) }
end
