namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do

		[User, Event, Invitation].each(&:delete_all)

		Event.populate 20 do |event|
			event.title = Populator.words(1..3).titleize
			event.description = Populator.sentences(2..5)
			event.location = Faker::Address.city
			event.date = 6.months.ago..1.year.since(Time.now)
			event.created_at = 1.year.ago..Time.now
			event.creator_id = 1..20
			event.img_url = 'default.png'
		end

		User.populate 20 do |user|
			user.name = Faker::Name.name
			user.email = Faker::Internet.email			
		end
	end
end