require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'Post #Index', type: :feature do
  background do
    visit new_user_session_path
    @first_user = User.create(name: 'Mark', photo: 'photos_url',
                              bio: 'Stuff about mark',
                              posts_counter: 6, email: 'mark@gmail.com',
                              password: '0123456', confirmed_at: Time.now)

    @mark_post = Post.create(title: 'mark post title',
                             text: 'mark post text', user: @first_user, comments_counter: 0, likes_counter: 0)

    @second_user = User.create(name: 'John', photo: 'photos_url',
                               bio: 'Stuff about John',
                               posts_counter: 1, email: 'John@gmail.com',
                               password: '0123456', confirmed_at: Time.now)

    fill_in 'user_email', with: @first_user.email
    fill_in 'user_password', with: @first_user.password
    click_button 'Log in'
  end

  it 'sees the users profile picture' do
    visit user_posts_path(@first_user.id)
    expect(page.body).to include('<div class="user-img">')
  end

  it 'sees the users name' do
    visit user_posts_path(@second_user.id)
    expect(page).to have_content('John')
  end

  it 'checks the user post counter' do
    visit user_posts_path(@second_user.id)
    expect(page).to have_content('Number of posts: 1')
  end

  it 'checks the user posts title' do
    visit user_posts_path(@first_user.id)
    expect(page).to have_content(@mark_post.title.to_s)
  end

  it 'sees the user posts body' do
    visit user_posts_path(@first_user.id)
    expect(page).to have_content(@mark_post.text.to_s)
  end

  it 'sees the first post comment' do
    @first_comment = Comment.create(text: 'marks post first comment', user: @first_user, post: @mark_post)
    visit user_posts_path(@first_user.id)
    expect(page).to have_content(@first_comment.text.to_s)
  end

  it 'sees the post comments count' do
    visit user_posts_path(@first_user.id)
    expect(page).to have_content("Comments: #{@mark_post.comments_counter}")
  end

  it 'sees the post likes count' do
    visit user_posts_path(@first_user.id)
    expect(page).to have_content("Likes: #{@mark_post.likes_counter}")
  end

  it 'sees pagination button if there are more than 6 posts' do
    visit user_posts_path(@first_user.id)
    expect(page.has_button?('pagination')).to be true
  end

  it 'redirects to the correct post' do
    visit user_posts_path(@first_user.id)
    click_link @mark_post.title.to_s
    expect(page).to have_current_path(user_post_path(@first_user, @mark_post))
  end
end

# rubocop:enable Metrics/BlockLength
