require 'spec_helper'

describe Event do
  
 before do
 	@event = Event.new(
 		title: "Beer party",
 		description: "Everyone is invited, a lot of beer and good people are garanteed",
 		location: "Moscow",
 		date: "09.0.2014"
 		)
 end

  it "is invalid without title" do
  	@event.title = ""

  	expect(@event).to be_invalid
  end

  it "is invalid without description" do
  	@event.description = ""

  	expect(@event).to have(1).errors_on(:description)
  end

  it "is invalid wihtout location" do
  	@event.location = ""

  	expect(@event).to be_invalid
  end

  it "is invalid without date" do
  	@event.date = ""

  	expect(@event).to have(1).errors_on(:date)
  end
end
