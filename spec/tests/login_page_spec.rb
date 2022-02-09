require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :feature do
  describe 'Login Page requirements' do
    it 'has username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_button('Log in')
    end
  end

  describe 'When the submit button is clicked' do
    it 'submits with out username and password inputs' do
      visit new_user_session_path
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Sign up')
    end

    it 'has incorrect username and password' do
      visit new_user_session_path
      fill_in 'user_email', with: 'sam@gmail.com'
      fill_in 'user_password', with: '0000'
      click_button 'Log in'
      expect(page).to have_content('Forgot your password')
    end

    it 'can log in with correct data' do
      @first_user = User.create(name: 'Mark', photo: 'photos_url',
                                bio: 'Stuff about mark',
                                posts_counter: 0, email: 'mark@gmail.com',
                                password: '0123456', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in 'user_email', with: @first_user.email
      fill_in 'user_password', with: @first_user.password
      click_button 'Log in'
      expect(page).to have_content('Logout')
    end
  end
end
