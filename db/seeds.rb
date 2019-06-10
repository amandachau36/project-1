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

User.create name: 'Charlotte Currey', email: 'cc@ga.co', password: 'chicken'
User.create name: 'Kayla Bullen', email: 'kb@ga.co', password: 'chicken'
User.create name: 'Jack Pasco', email: 'jp@ga.co', password: 'chicken'

puts "#{User.all.length} users have been created"


Schedule.destroy_all

puts "Seeding schedule table"

Schedule.create title: 'Yin in the Park', level: 'All', duration: '60', start: DateTime.strptime('06/21/2019 5:00pm','%m/%d/%Y %I:%M%P'), description: 'Unwind at the end of the week. Bring a blanket or warm jumper.'

Schedule.create title: 'Rooftop Hatha', level: 'All', duration: '90', start:  DateTime.strptime('06/19/2019 7:00','%m/%d/%Y %H:%M'), description: 'Start your day with gentle movement and a beautiful view.'

Schedule.create title: 'Beach flow', level: 'Intermediate', duration: '50', start:  DateTime.strptime('06/28/2019 10:00','%m/%d/%Y %H:%M'), description: 'Playing with balance and inversions.'


puts "#{Schedule.all.length} schedule items have been created"
