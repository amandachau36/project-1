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


s1 = Schedule.create title: 'Yin in the Park', level: 'All', duration: 60, start: DateTime.strptime('06/13/2019 5:00pm','%m/%d/%Y %I:%M%P'), description: 'Unwind at the end of the week. Bring a blanket or warm jumper.'

s2 = Schedule.create title: 'Rooftop Hatha', level: 'All', duration: 90, start:  DateTime.strptime('06/19/2019 7:00','%m/%d/%Y %H:%M'), description: 'Start your day with gentle movement and a beautiful view.'

s3 = Schedule.create title: 'Beach Flow', level: 'Intermediate', duration: 50, start:  DateTime.strptime('06/28/2019 10:00','%m/%d/%Y %H:%M'), description: 'Playing with inversions and balance.'

s4 = Schedule.create title: 'Mid-day Acro Yoga Jam', level: 'Intermediate', duration: 60, start:  DateTime.strptime('06/28/2019 12:00','%m/%d/%Y %H:%M'), description: 'Make the most of your lunch break - move, connect, and have fun!'



puts "#{Schedule.all.length} schedule items have been created"



# one to many association: an instructor will have many classes but an instructor will only have one class
u1.classes_teaching << s1 << s2 << s3 << s4

u1.update is_instructor: 1
u2.update is_instructor: 0
u3.update is_instructor: 0
u4.update is_instructor: 0

s1.update number_of_repeats: 1
s2.update number_of_repeats: 2
s3.update number_of_repeats: 0
s4.update number_of_repeats: 0

puts 'creating enrollment table'

# use students alias for user when referring to enrollment

e1 = Enrollment.create schedule: s1, date: s1.start, student: u2
e1 = Enrollment.create schedule: s1, date: s1.start, student: u3
e1 = Enrollment.create schedule: s1, date: s1.start, student: u4
e2 = Enrollment.create schedule: s1, date: s1.start+7.days, student: u2
e3 = Enrollment.create schedule: s2, date: s2.start, student: u3
e4 = Enrollment.create schedule: s2, date: s2.start+7.days, student: u3
e5 = Enrollment.create schedule: s2, date: s2.start+2*7.days, student: u4
e6 = Enrollment.create schedule: s3, date: s3.start, student: u4
e7 = Enrollment.create schedule: s4, date: s4.start, student: u4
e8 = Enrollment.create schedule: s3, date: s3.start, student: u2
e9 = Enrollment.create schedule: s4, date: s4.start, student: u2

puts 'now updating address to schedule'

# seeding doesn't work due to google API restrictions
# what about seeding repeats, need to validate and makes presence true
# I also want to seed past dates.
delay = 5
s1.update address: '1 William St, Sydney 2010'
sleep delay
s2.update address: '330 George St, Sydney 2000'
sleep delay
s3.update address: '1 Notts Ave, Bondi Beach 2026'
sleep delay
s4.update address: '458 Harris St, Ultimo 2007'

# s2.update address: '285A Crown St, Surry Hills NSW 2010'
# s3.update address: '1 Notts Ave, Bondi Beach 2026'
# s4.update address: '2 Northcote Rd, Glebe 2037'



puts 'done seeding'
