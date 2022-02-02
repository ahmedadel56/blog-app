# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: 'Sam', photo: 'photo_url', bio: 'I am a developer', posts_counter: 0)
User.create(name: 'Zain', photo: 'photo_url', bio: 'I am a teacher', posts_counter: 0)
User.create(name: 'Ahmed', photo: 'photo_url', bio: 'I am a nurse', posts_counter: 0)
User.create(name: 'Mohamed', photo: 'photo_url', bio: 'I am a technician', posts_counter: 0)

post = Post.create(title: "test title", text: "text test", user_id: 1, comments_counter: 0, likes_counter:0)
Comment.create(user_id: 1, post: post, text: "nice one")
Like.create(user_id: 1, post: post) 
