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

Schedule.create title: 'Yin in the Park', level: 'All', duration: '60', start: DateTime.new(2019, 6, 21, 17, 00), description: 'Unwind at the end of the week. Bring a blanket or warm jumper.'

Schedule.create title: 'Rooftop Hatha', level: 'All', duration: '90', start:  DateTime.new(2019, 6, 19, 7, 00), description: 'Start your day with gentle movement and a beautiful view.'

Schedule.create title: 'Beach flow', level: 'Intermediate', duration: '50', start:  DateTime.new(2019, 6, 18, 10, 00), description: 'Playing with balance and inversions.'


puts "#{Schedule.all.length} schedule items have been created"
S
