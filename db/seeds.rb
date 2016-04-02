# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([{name: "Fede",
              email: "fede@test.com",
              password: "12345678"},
             ])

User.create!([{name: "Caco",
              email: "caco@test.com",
              password: "12345678"},
             ])

User.create!([{name: "Nico",
              email: "nico@test.com",
              password: "12345678"},
             ])
