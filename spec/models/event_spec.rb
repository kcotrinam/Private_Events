require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
 describe "Event validation" do
  let(:new_user) { User.new(name: 'Kevin', email: 'kenvin@gmail.com') }
  let(:invalid_event) { Event.new(title: 'New event', description: 'this is an event', date: DateTime.now) }
  it 'It should return false if user_id is not passed' do
    expect(invalid_event.save).to eql(false)  
  end

  it 'It should return false if the inputs are empty' do
    empty_user = Event.new
    expect(empty_user.valid?).to eql(false)  
  end
  
  it 'It should return false if one the title or description length are higher than 50 characters' do
    new_event = Event.new(title: 'qwertyuiopñlkjhgfdasaxczvbnmnbvcxzasdfghjklñpoiuytrewqwfsdasddfs', description: 'description', user_id: 1)
    expect(new_event.valid?).to eql(false)  
  end
 end

 describe 'has many categories' do
    it { should respond_to(:invitations) }
    it { should respond_to(:attendees) }
    it { should belong_to(:user) }
  end
end