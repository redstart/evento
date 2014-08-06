class Event < ActiveRecord::Base

	belongs_to :creator, class_name: "User"

	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :date, presence: true
end
