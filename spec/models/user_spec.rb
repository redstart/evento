require 'spec_helper'

describe User do
	it 'is valid with username, email and password' do
	  expect(user = build(:user)).to be_valid
	end

	it 'is invalid without username' do
	  user = build(:user, username: nil)
	  expect(user).to be_invalid
	end

	it 'is invalid without email' do
	  user = build(:user, email: nil)
	  expect(user).to have(1).errors_on(:email)
	end

	it 'is invalid with duplicate email address' do
	  create(:user, email: 'corp@example.com')
	  user = build(:user, email: 'corp@example.com')
	  expect(user).to have(1).errors_on(:email)
	end

	it 'is invalid with invalid password' do 
	  user = build(:user, password: '')
	  expect(user).to be_invalid
	end
end
