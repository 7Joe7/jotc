# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

News.create!(name: 'News #1', content: 'Hi, this is first news I have for, it is kinda lame, hope you do not mind.')

99.times do |n|
  name = Faker::Name.name
  User.create!(name: name, content: name + n)
end

User.create!(name: 'Example User',
             email: 'example@test.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@test.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.messages.create!(content: content) }
endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')