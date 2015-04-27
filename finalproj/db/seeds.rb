# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seed one admin and three regular users
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

u4 = User.new
u4.email = 'newbie@gmail.com'
u4.username = 'John'
u4.password = 'abc123'
u4.password_confirmation = 'abc123'
u4.isadmin = false
u4.avatar = File.open(File.join(Rails.root, 'public/uploads/default/guy.jpg'))
u4.save!

# Seed a few questions from different users
q1 = u1.questions.create(title: 'How to computer?', content: 'I have forgotten how to computer.  Please help.')
q2 = u1.questions.create(title: 'Why there be no parking on campus?', content: 'I can\'t find any parking on campus. Anyone got any suggestions.')
q3 = u2.questions.create(title: 'Why is it snowing in April?', content: 'Does this always happen here?')
q4 = u2.questions.create(title: 'I\'m feeling hungry...', content: 'Where are the best places to eat?')
q5 = u4.questions.create(title: 'Where is the Registrar?', content: 'I need help with my classes. Where is the registrar on campus?')
q6 = u4.questions.create(title: 'Free food? I\'m poor. Where?', content:'I was wondering where a poor college student might find some free food? Anyone have free food?')
q7 = u1.questions.create(title: 'I don\'t does English. Anyone does English?', content:'English is hard. Anyone else do English or can teach English?')
q8 = u1.questions.create(title: 'Easy way to get to Denver?', content: 'I want to get to Denver for the game. I\'ve heard Denver is terrible parking-wise. Any good way to get there?')

# Seed a few answers from appropriate users
q1.answers.create(content: 'You can try this site called "google", but I forgot the URL.', user_id: u2.id)
q1.answers.create(content: 'Don\'t worry, I don\'t know how to computer either.', user_id: u2.id)
q2.answers.create(content: 'I wish I knew...I wish I knew', user_id:u3.id)
q3.answers.create(content: 'Just wait until May, my friend.', user_id: u1.id)
q3.answers.create(content: 'There is no Spring. There is only winter and summer.', user_id: u4.id)
q3.answers.create(content: 'Welcome to Colorado! Where the seaons don\'t matter because snow.', user_id: u4.id)
q3.answers.create(content: 'Yeah...it does that. Sometimes in July too.', user_id: u1.id)
q4.answers.create(content: 'Since I am not an eater myself, I can\'t help you.', user_id: u4.id)
q4.answers.create(content: 'Sherpa house, where spicy really means spicy', user_id: u3.id)
q5.answers.create(content: 'It\'s in the Student Center, bottom floor. At least that\'s where it used to be', user_id: u2.id)
q6.answers.create(content: 'Look at campus emails.', user_id: u1.id)
q6.answers.create(content: 'There is lots of free food usually all over campus.', user_id: u3.id)
q7.answers.create(content: 'Neither do I. I does binary.', user_id: u2.id)
q7.answers.create(content: 'I does hex. English is my second language.', user_id: u4.id)
q7.answers.create(content: '4E 6F 2E 20 45 6E 67 6C 69 73 68 20 69 73 20 68 61 72 64 2E 20', user_id: u3.id)
q8.answers.create(content: 'Light rail is awesome! Plus school gives us yearly pass.', user_id: u2.id)
q8.answers.create(content: 'Teleportation? I\'ve heard we\'ve been perfecting the teleporter pad.', user_id: u4.id)
q8.answers.create(content: 'Oh yeah. The FLOO Network is up and running. It\'s in the basement of Meyer. The physicist have been running it there and in Chauvenet.', user_id: u2.id)

# Seed a few tags for questions
q1.tags.create(category: 'fun')
q1.tags.create(category: 'other')
q2.tags.create(category: 'parking')
q3.tags.create(category: 'other')
q4.tags.create(category: 'food')
q4.tags.create(category: 'housing')
q5.tags.create(category: 'campus')
q6.tags.create(category: 'food')
q7.tags.create(category: 'other')
q8.tags.create(category: 'fun')
