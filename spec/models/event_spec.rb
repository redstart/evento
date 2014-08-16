require 'spec_helper'

describe Event do
  it 'is valid with title, date, location and description presented' do
  	event = build(:event)
  	expect(event).to be_valid
  end

  it 'is invalid without title' do
  	event = build(:event, title: '')
  	expect(event).to have(1).errors_on(:title)
  end

  it 'is inavlid without date' do
  	event = build(:event, date: '')
  	expect(event).to have(1).errors_on(:date)
  end

end
