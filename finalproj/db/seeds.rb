# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seed one admin and two regular users
u1 = User.new
u1.email = 'regular1@email.com'
u1.username = 'regular1'
u1.password = 'password'
u1.password_confirmation = 'password'
u1.avatar = File.open(File.join(Rails.root, 'public/uploads/default/gal.jpg'))
u1.save!

u2 = User.new
u2.email = 'regular2@email.com'
u2.username = 'regular2'
u2.password = 'password'
u2.password_confirmation = 'password'
u2.reputation = 5
u2.avatar = File.open(File.join(Rails.root, 'public/uploads/default/guy.jpg'))
u2.save!

u3 = User.new
u3.email = 'admin@email.com'
u3.username = 'admin'
u3.password = 'password'
u3.password_confirmation = 'password'
u3.isadmin = true
u3.reputation = 10
u3.avatar = File.open(File.join(Rails.root, 'public/uploads/default/default.jpg'))
u3.save!

# Seed a few questions from different users
q1 = u1.questions.create(title: 'How to computer?', content: 'I have forgotten how to computer.  Please help.')
q2 = u2.questions.create(title: 'Why is it snowing in April?', content: 'Does this always happen here?')
q3 = u2.questions.create(title: 'I\'m feeling hungry...', content: 'Where are the best places to eat?')

# Seed a few answers from appropriate users
q1.answers.create(content: 'You can try this site called "google", but I forgot the URL.', user_id: u2.id)
q1.answers.create(content: 'Don\'t worry, I don\'t know how to computer either.', user_id: u3.id)
q2.answers.create(content: 'Just wait until May, my friend.', user_id: u1.id)
q3.answers.create(content: 'Since I am not an eater myself, I can\'t help you.', user_id: u1.id)
q3.answers.create(content: 'Sherpa house, where spicy really means spicy', user_id: u3.id)

# Seed a few tags for questions
q1.tags.create(category: 'Fun')
q1.tags.create(category: 'Other')
q2.tags.create(category: 'Other')
q3.tags.create(category: 'Food')
q3.tags.create(category: 'Housing')

