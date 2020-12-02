require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  describe 'validate user' do
    let(:new_user) { User.create(name: 'Kevin', email: 'kenvin@gmail.com') }
    let(:user_same_email) { User.new(name: 'Juan', email: 'kenvin@gmail.com') }
    it 'shows the right content' do
      expect(new_user).to be_valid
    end
    it 'validate unique email' do
      expect(user_same_email.save).to eq(false)
    end
  end
end
