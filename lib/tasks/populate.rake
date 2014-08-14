namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do

		[User, Event, Invitation].each(&:delete_all)
		password = "password"

		Event.populate 20 do |event|
			event.title = Populator.words(1..3).titleize
			event.description = Populator.sentences(2..5)
			event.location = Faker::Address.city
			event.date = 6.months.ago..1.year.since(Time.now)
			event.created_at = 1.year.ago..Time.now
			event.creator_id = 1..20
		end

		User.populate 20 do |user|
			user.username = Faker::Name.name
			user.email = Faker::Internet.email	
 			user.encrypted_password = User.new(:password => password).encrypted_password
 			user.sign_in_count = 1	
		end
	end
end