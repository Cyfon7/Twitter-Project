# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Tweet.delete_all
Like.delete_all

User.create([
    { name: "Jorge",   email: "jorge@mail.com",  password: "123456", password_confirmation: "123456" },
    { name: "Maria",   email: "maria@mail.com",  password: "123456", password_confirmation: "123456" },
    { name: "Luis",    email: "luis@mail.com",   password: "123456", password_confirmation: "123456" },
    { name: "Ana",     email: "ana@mail.com",    password: "123456", password_confirmation: "123456" },
    { name: "Pedro",   email: "pedro@mail.com",  password: "123456", password_confirmation: "123456" },
    { name: "Juana",   email: "juana@mail.com",  password: "123456", password_confirmation: "123456" },
    { name: "Miguel",  email: "miguel@mail.com", password: "123456", password_confirmation: "123456" },
    { name: "Carmen",  email: "carmen@mail.com", password: "123456", password_confirmation: "123456" },
    { name: "Carlos",  email: "carlos@mail.com", password: "123456", password_confirmation: "123456" },
    { name: "Rita",    email: "rita@mail.com",   password: "123456", password_confirmation: "123456" }
])

100.times do
    user = User.order('RANDOM()').first
    tweet = Tweet.create(
        content: Faker::Lorem.paragraph,
        image: Faker::Avatar.image(size: "65x65"),
        user_id: user.id
    )
end

