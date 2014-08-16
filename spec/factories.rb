require 'faker'

FactoryGirl.define do
	factory :user do
		username { Faker::Name.name }
		email { Faker::Internet.email }
		password { Faker::Internet.password}
	end
end

FactoryGirl.define do
	factory :event do
		title "Event"
		date "28.01.2015"
		location "St.Petersburg"
		description "Yet another event"
		image { File.new("#{Rails.root}/spec/support/fixtures/missing_medium.png") }
	end
end