require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  describe 'validate user' do
    let(:new_user) { User.new(name: 'Kevin', email: 'kenvin@gmail.com') }
    let(:user_same_email) { User.new(name: 'Juan', email: 'kenvin@gmail.com') }
    let(:user_wrong_email) { User.new(name: 'Juan', email: 'kenvingmailcom') }
    it 'shows the right content' do
      expect(new_user).to be_valid
    end
    it 'validate unique email' do
      new_user.save
      expect(user_same_email.save).to eq(false)
    end
    it 'validate if the email is correct' do
      expect(user_wrong_email.save).to eq(false)
    end

    it 'Save if all validation pass' do
      expect(new_user.save).to eq(true)
    end
  end
  context 'has many categories' do
    it { should respond_to(:events) }
    it { should respond_to(:invitations) }
    it { should respond_to(:attended_events) }
  end
end
