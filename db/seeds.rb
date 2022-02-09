# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

User.create!(name: 'Jhon', photo: 'photo_url', bio: 'I am a developer', posts_counter: 0, email: 'iyadicy@gmail.com',encrypted_password: '12', role: 'admin')
User.create!(name: 'Bella', photo: 'photo_url', bio: 'I am a teacher', posts_counter: 0, email: 'houssam@gmail.com',encrypted_password: '12')
User.create!(name: 'Kim', photo: 'photo_url', bio: 'I am a nurse', posts_counter: 0, email: 'chawanzi@gmail.com',encrypted_password: '12')
User.create!(name: 'Mohamed', photo: 'photo_url', bio: 'I am a technician', posts_counter: 0, email: 'mohamed@gmail.com',encrypted_password: '12',)

post = Post.create!(title: "test title", text: "text test", user_id: 1, comments_counter: 0, likes_counter:0)
Comment.create!(user_id: 1, post: post, text: "nice one")
Like.create!(user_id: 1, post: post)