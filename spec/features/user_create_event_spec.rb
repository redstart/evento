# require 'spec_helper'

# feature 'User create event' do

#   scenario 'with valid information' do
#   	before do 
#     let(:user) { FactoryGirl.create(:user) }
    
#     visit new_session_path

#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     click_button 'Sign in'
#     end
#     create_event_with('Awesome event',
#   	                  '23.08.2014',
#   	                  'St.Petersburg',
#   	                  'Cool party for everyone.'
#   	                  )

#   	expect(page).to have_content('Awesome event', 'Delete event')
#   end

#   def create_event_with(title, date, location, description)
#   	visit new_event_path

#   	fill_in 'Title', with: title
#   	fill_in 'Date', with: date
#   	fill_in 'Location', with: location
#   	fill_in 'Description', with: description
#   	click_button 'Create event'
#   end
# end