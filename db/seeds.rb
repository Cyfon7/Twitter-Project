# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
Tweet.delete_all
Like.delete_all

user = User.create([
    { name: "Jorge",   email: "jorge@mail.com",  image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Maria",   email: "maria@mail.com",  image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Luis",    email: "luis@mail.com",   image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Ana",     email: "ana@mail.com",    image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Pedro",   email: "pedro@mail.com",  image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Juana",   email: "juana@mail.com",  image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Miguel",  email: "miguel@mail.com", image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Carmen",  email: "carmen@mail.com", image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Carlos",  email: "carlos@mail.com", image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" },
    { name: "Rita",    email: "rita@mail.com",   image: Faker::Avatar.image(size: "65x65"), password: "123456", password_confirmation: "123456" }
])

100.times do
    user = User.order('RANDOM()').first
    tweet = Tweet.create(
        content: Faker::Lorem.paragraphs,
        user_id: user.id
    )
end

50.times do
    rt = Tweet.order('RANDOM()').first
    tweet = Tweet.order('RANDOM()').last
    Tweet.where(id: rt.id).update(tweet_id: tweet.id)
end

200.times do
    tweet = Tweet.order('RANDOM()').first
    user = User.order('RANDOM()').first
    like = Like.create(
        user_id: user.id,
        tweet_id: tweet.id
    )
end