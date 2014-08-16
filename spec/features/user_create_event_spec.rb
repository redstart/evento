require 'spec_helper'

feature 'User create event' do

  background do
    visit new_user_session_path

    user = create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  scenario 'with valid information' do
    
    create_event_with('Awesome event',
  	                  '23.08.2014',
  	                  'St.Petersburg',
  	                  'Cool party for everyone.'
  	                  )
  	expect(page).to have_content('Awesome event')
  end

  scenario 'without title and description' do
    
    create_event_with('',
                      '23.08.2014',
                      'St.Petersburg',
                      ''
                      )
    expect(page).to have_content("Title can't be blank")
  end

  def create_event_with(title, date, location, description)
  	visit new_event_path

  	fill_in 'Title', with: title
  	fill_in 'Date', with: date
  	fill_in 'Location', with: location
  	fill_in 'Description', with: description
  	click_button 'Create'
  end


end