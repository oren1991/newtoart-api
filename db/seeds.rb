# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Hello User', email: 'random@mail.com', password: 'hello')
user2 = User.create(name: 'World User', email: 'random@mail2.com', password: 'hello2')
role = Role.create(name: 'Admin', admin: true)
like = Like.create(likable: user2)
user.roles << role
user2.roles << role
user.liked << like

Property.create(name: 'form', icon: 'shapes', description: 'random description', admin: user)
Property.create(name: 'perpective', icon: 'cube', description: 'random description', admin: user)
Property.create(name: 'values', icon: 'adjust', description: 'random description', admin: user)
Property.create(name: 'composition', icon: 'theater-masks', description: 'random description', admin: user)
Property.create(name: 'color', icon: 'palette', description: 'random description', admin: user)
Property.create(name: 'anatomy', icon: 'walking', description: 'random description', admin: user)
Property.create(name: 'story', icon: 'book', description: 'random description', admin: user)


20.times.each do
  c = Content.create(
      title: "My new DUMMY content",
      description: "This is a description kfaédfjkaélk jfaklsdj fkladsj flaksjdflakjsdf éladjs féasd adséalksdfj élaksdjf élkadjsflékaslf ",
      source_type: "source_type",
      media_hash: "random",
      artist: user2,
      properties: Property.all
  )
  c.contents_properties.each do |cp|
    cp.value = rand(6)
    cp.save!
  end
end

Content.first.reviews.create(review_text: "this is a random review", reviewer: user, properties: Property.all)

