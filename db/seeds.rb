# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EscapeRoom.create(title: "Test", location:"online", difficulty:"easy", description:"it is for 5 players", hours: "9am to 10pm")
EscapeRoom.create(title: "Test 2", location:"online", difficulty:"hard", description:"it is for 6", hours: "12")