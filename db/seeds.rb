User.create!(name:  "Zach Zhu",
             email: "zach.zhu1@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "student-#{n+1}@frostburg.edu"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
10.times do |n|
  name = "Movie-#{n+1}"
  comment = Faker::Lorem.sentence(5)
  users.each { |user| user.movies.create!(name: name, comment: comment) }
end