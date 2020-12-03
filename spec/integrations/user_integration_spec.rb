require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'Create User'
    visit new_invitation_path
    expect(page).to have_content('new user test')
  end

  scenario 'invalid inputs' do
    visit new_user_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'Create User'
    expect(page).to have_content('- The field can not be empty')
  end
end
