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
