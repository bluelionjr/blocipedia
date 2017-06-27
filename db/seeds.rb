require 'random_data'

User.create!(
  email: "bluelionjr@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

admin = User.create!(
  email: "jrmitchelllist@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  role: "admin"
)

premium = User.create!(
  email: "pokeygray@yahoo.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  role: "premium"
)

# 11.times do
#   User.create!(
#     email: Faker::Internet.unique.safe_email,
#     password: Faker::Internet.password(6)
#   )
# end


# Create Wikis
5.times do
  Wiki.create!(
    user: User.all.sample,
    title: Faker::StarWars.character,
    body: Faker::StarWars.quote,
    private: true
  )
end

5.times do
  Wiki.create!(
    user: User.all.sample,
    title: Faker::StarWars.character,
    body: Faker::StarWars.quote,
    private: false
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
