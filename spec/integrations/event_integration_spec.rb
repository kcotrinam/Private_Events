require 'rails_helper'

RSpec.describe 'Creating a event', type: :feature do
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'Create User'

    visit login_path
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'login'

    visit new_event_path
    fill_in 'Title', with: 'new event title test'
    fill_in 'Description', with: 'some test description for the test event'
    fill_in 'Date', with: DateTime.now.to_s
    click_on 'Create Event'

    visit events_path
    expect(page).to have_content('new event title test')
  end

  scenario 'invalid inputs' do
    visit new_user_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'Create User'

    visit login_path
    fill_in 'Email', with: 'newusertest@user.com'
    click_on 'login'

    visit new_event_path
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'some test description for the test event'
    fill_in 'Date', with: DateTime.now.to_s
    click_on 'Create Event'

    visit events_path
    expect(page).to have_content('Something went wrong')
  end
end
