require "faker"

users = User.all
posts = Post.all

NUM_COMMENTS = 30

NUM_COMMENTS.times do
  Comment.create(
    body: Faker::Lorem.paragraph,
    user: users.sample,
    post: posts.sample
  )
end
