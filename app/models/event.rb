class Event < ActiveRecord::Base

	belongs_to :creator, class_name: "User"
	has_many :registrations, foreign_key: "attended_event_id"
	has_many :attendees, through: :registrations
	has_attached_file :image, styles: { medium: "200x200", thumb: "100x100" }, default_url: "missing_:style.png"


	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :date, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	scope :past, -> { where("Date < ?", Date.today).order("Date ASC") }

	scope :upcoming, -> { where("Date >= ?", Date.today).order("Date ASC") }
end
