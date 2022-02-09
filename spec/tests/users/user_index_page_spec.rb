require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'User page', js: true, type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Sammie',
                              photo: 'user_logo-0691c9b921c343343feb777298f064eef6445537eaa4716f7ff510720bb2ff91.png',
                              bio: 'stuff about sammie',
                              posts_counter: 0, email: 'sammie@gmail.com',
                              password: 'abcde', confirmed_at: Time.now)

    @second_user = User.create(name: 'Alice',
                               photo: 'user_logo-0691c9b921c343343feb777298f064eef6445537eaa4716f7ff510720bb2ff91.png',
                               bio: 'stuff about alice',
                               posts_counter: 0, email: 'alice@gmail.com', password: 'abcdefg',
                               confirmed_at: Time.now)

    fill_in 'user_email', with: @second_user.email
    fill_in 'user_password', with: @second_user.password
    click_button 'Log in'
  end

  describe 'Details of user' do
    it 'has view for all users' do
      users = User.all
      visit users_path
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'has each user profile picture' do
      users = User.all
      visit users_path
      users.each do |user|
        expect(page.body).to include("<img width=\"100%\" height=\"100%\" src=\"/assets/user/#{user.photo}\">")
      end
    end

    it 'shows posts count per user' do
      users = User.all
      visit users_path
      users.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end
  end

  describe 'When a user is clicked, ' do
    it 'redirects to the user main page' do
      users = User.all
      click_link users[0].name
      expect(current_path).to eql(user_path(id: users[0].id))
    end
  end
end

# rubocop:enable Metrics/BlockLength
