class User < ActiveRecord::Base

	has_many :created_events, foreign_key: "creator_id", class_name: "Event"

	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, with: /@/

end
