require 'spec_helper'

describe User do

  before do
  	@user = User.new(
  		name: "John",
  		email: "john@example.com"
  		)
  end

  it "is valid with name and email" do
  	expect(@user).to be_valid
  end

  it "is invalid without a name" do
  	@user.name = ""
  	expect(@user).to be_invalid
  end

  it "is invalid without an email" do
  	@user.email =""
  	expect(@user).to be_invalid
  end

  it "is invalid with duplicate email" do
  	User.create(
  		name: "John",
  		email: "john@example.com"
  		)

  	user = User.new(
  		name: "Paul",
  		email: "john@example.com"
  		)

  	expect(user).to have(1).errors_on(:email)
  end

  it "'s email is invalid without @ sign" do
  	@user.email = "johndoe.com"

  	expect(@user).to be_invalid
  end
end
