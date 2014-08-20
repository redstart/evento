class Event < ActiveRecord::Base
	
# relationships
	belongs_to :creator, class_name: "User"
	has_many :registrations, foreign_key: "attended_event_id"
	has_many :attendees, through: :registrations
	has_attached_file :image, styles: { medium: "200x200", thumb: "100x100" }, default_url: "missing_:style.png"
	has_many :taggings
	has_many :tags, through: :taggings

# validations
	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :date, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

# event filters
	scope :past, -> { where("Date < ?", Date.today).order("Date ASC") }
	scope :upcoming, -> { where("Date >= ?", Date.today).order("Date ASC") }

#tag methods
	def self.tagged_with(name)
		Tag.find_by_name!(name).events
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(", ").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end
end
