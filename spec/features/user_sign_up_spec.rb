require 'spec_helper'

feature 'Visitor sign up' do
  scenario 'with valid username, email and password' do
    sign_up_with 'Pete', 'email@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with blank username' do
  	sign_up_with '', 'email@example.com', 'password'

  	expect(page).to have_content('Sign up')
  end

  scenario 'with invalid email' do
  	sign_up_with 'Pete', 'email', 'password'

  	expect(page).to have_content('Sign up')
  end

  scenario 'with blank pasword' do
  	sign_up_with 'Pete', 'email@example.com', ''

  	expect(page).to have_content('Sign up')
  end

  def sign_up_with(username, email, password)
    visit new_user_registration_path

    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end
