class User < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates_format_of :email, with: /@/

end
