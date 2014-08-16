require 'spec_helper'

feature 'User sign in' do
  let(:user) { create(:user) }

  scenario 'with valid email' do
  	sign_in_with user.email, user.password

  	expect(page).to have_content('My profile')
  end

  scenario 'with invalid email' do
  	sign_in_with 'email', user.password

  	expect(page).to have_content('Sign in')
  end

  scenario 'with invalid password' do
  	sign_in_with user.email, 'foobar'

  	expect(page).to have_content('Invalid email or password')
  end

  def sign_in_with(email, password)
  	visit new_user_session_path

  	fill_in 'Email', with: email
  	fill_in 'Password', with: password
  	click_button 'Sign in'
  end	
end