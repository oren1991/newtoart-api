# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Hello User')
user2 = User.create(name: 'World User')
role = Role.create(name: 'Admin', admin: true)
like = Like.create(likable: user2)
user.roles << role
user2.roles << role
user.liked << like
