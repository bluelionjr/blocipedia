require 'random_data'

User.create!(
  email: "bluelionjr@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

premium = User.create!(
  email: "premium@jrtest.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  role: "premium"
)

admin = User.create!(
  email: "admin@jrtest.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  role: "premium"
)

11.times do
  User.create!(
    email: Faker::Internet.unique.safe_email,
    password: Faker::Internet.password(6)
  )
end


# Create Wikis
25.times do
  Wiki.create!(
    user: User.all.sample,
    title: Faker::Hacker.noun,
    body: Faker::Hacker.say_something_smart
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
