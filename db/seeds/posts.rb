require "faker"

users = User.all

NUM_POSTS = 10

NUM_POSTS.times do
  Post.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: 5).join("\n"),
    user: users.sample
  )
end
