require "faker"

users = User.all

NUM_POSTS = 50

def generate_markdown
  intro_section_num_p = rand(2..5)
  main_section_num_p = rand(2..5)

  <<~MARKDOWN
    ### Blog Post Intro

    #{Array.new(intro_section_num_p) { Faker::Lorem.paragraph }.join("\n\n")}

    ### Main Post Section

    #{Array.new(main_section_num_p) { Faker::Lorem.paragraph }.join("\n\n")}

    ### Conclusion

    #{Faker::Lorem.paragraph}

    - #{Faker::Lorem.sentence}
    - #{Faker::Lorem.sentence}
    - #{Faker::Lorem.sentence}
  MARKDOWN
end

NUM_POSTS.times do
  Post.create(
    title: Faker::Book.title,
    body: generate_markdown,
    user: users.sample
  )
end
