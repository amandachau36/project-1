# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Possible to seed without image but must add "has_secure"

User.destroy_all

puts "Seeding Users table"

u1 = User.create name: 'Charlotte Currey', email: 'cc@ga.co', password: 'chicken'
u2 = User.create name: 'Kayla Bullen', email: 'kb@ga.co', password: 'chicken'
u3 = User.create name: 'Jack Pasco', email: 'jp@ga.co', password: 'chicken'
u4 = User.create name: 'Dan Silva', email: 'ds@ga.co', password: 'chicken'

puts "#{User.all.length} users have been created"


Schedule.destroy_all

puts "Seeding schedule table"

s1 = Schedule.create title: 'Yin in the Park', level: 'All', duration: '60', start: DateTime.strptime('06/21/2019 5:00pm','%m/%d/%Y %I:%M%P'), description: 'Unwind at the end of the week. Bring a blanket or warm jumper.'

s2 = Schedule.create title: 'Rooftop Hatha', level: 'All', duration: '90', start:  DateTime.strptime('06/19/2019 7:00','%m/%d/%Y %H:%M'), description: 'Start your day with gentle movement and a beautiful view.'

s3 = Schedule.create title: 'Beach Flow', level: 'Intermediate', duration: '50', start:  DateTime.strptime('06/28/2019 10:00','%m/%d/%Y %H:%M'), description: 'Move to the beat of the ocean. Playing with inversions and balance'

s3 = Schedule.create title: 'Mid-day Acro Yoga Jam', level: 'Intermediate', duration: '60', start:  DateTime.strptime('06/28/2019 12:00','%m/%d/%Y %H:%M'), description: 'Make the most of your lunch break - move, connect, and have fun!'



puts "#{Schedule.all.length} schedule items have been created"


# need a way to generate this automatically when a user creates an account

PersonalSchedule.destroy_all

ps1 = PersonalSchedule.create user_id: u1.id
ps2 = PersonalSchedule.create user_id: u2.id
ps3 = PersonalSchedule.create user_id: u3.id
ps4 = PersonalSchedule.create user_id: u4.id
