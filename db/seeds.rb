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

Property.create(property_type: 'form', icon: 'shapes', description: 'random description', admin: user)
Property.create(property_type: 'perpective', icon: 'cube', description: 'random description', admin: user)
Property.create(property_type: 'values', icon: 'adjust', description: 'random description', admin: user)
Property.create(property_type: 'composition', icon: 'theater-masks', description: 'random description', admin: user)
Property.create(property_type: 'color', icon: 'palette', description: 'random description', admin: user)
Property.create(property_type: 'anatomy', icon: 'walking', description: 'random description', admin: user)
Property.create(property_type: 'story', icon: 'book', description: 'random description', admin: user)


50.times.each do
  Content.create(
      title: "My new content",
      description: "This is a description kfaédfjkaélk jfaklsdj fkladsj flaksjdflakjsdf éladjs féasd adséalksdfj élaksdjf élkadjsflékaslf ",
      source_type: "source_type",
      media_hash: "random",
      artist: user2,
      properties: Property.all
  )
end

