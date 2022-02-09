require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'User main page', js: true, type: :feature do
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

    @first_post = Post.create(title: 'My first post', text: 'This is my first post',
                              user_id: @second_user.id, comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(title: 'My second post', text: 'This is my second post',
                               user_id: @second_user.id, comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(title: 'My third post', text: 'This is my third post',
                              user_id: @second_user.id, comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(title: 'My fourth post', text: 'This is my fourth post',
                               user_id: @second_user.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'This is my first comment', user_id: @second_user.id, post_id: @fourth_post.id)
    Comment.create(text: 'This is my second comment', user_id: @first_user.id, post_id: @fourth_post.id)

    fill_in 'user_email', with: @second_user.email
    fill_in 'user_password', with: @second_user.password
    click_button 'Log in'
  end

  describe 'View all user details on user main page' do
    it 'has user profile picture' do
      users = User.all
      click_link users[0].name
      expect(page.body).to include("<img width=\"100%\" height=\"100%\" src=\"/assets/user/#{users[0].photo}\">")
    end

    it "shows the user's username" do
      users = User.all
      click_link users[0].name
      expect(page).to have_content(users[0].name)
    end

    it 'shows number of user post' do
      users = User.all
      click_link users[0].name
      expect(page).to have_content("Number of posts: #{users[0].posts_counter}")
    end

    it "shows the user's bio" do
      users = User.all
      click_link users[0].name
      expect(page).to have_content(users[0].bio)
    end

    it "shows the user's first 3 posts" do
      user = User.find(@second_user.id)
      click_link user.name
      expect(page).to have_content(user.posts[3].title)
      expect(page).to have_content(user.posts[2].title)
      expect(page).to have_content(user.posts[1].title)
      expect(page).to_not have_content(user.posts[0].title)
    end

    it 'has view all posts button' do
      users = User.all
      click_link users[0].name
      expect(page).to have_content('See all posts')
    end

    it 'redirects to post show page when you click on post' do
      users = User.all
      click_link users[0].name
      click_link users[0].posts[1].title
      expect(page).to have_button('Comment')
    end

    it "shows all posts when you click 'See all posts'" do
      users = User.all
      click_link users[0].name
      click_link 'See all posts'
      users[0].posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
