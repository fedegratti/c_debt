# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([{name: "Fede",
              email: "fede@test.com",
              password: "12345678",
              admin: true},
             ])

User.create!([{name: "Caco",
              email: "caco@test.com",
              password: "12345678"},
             ])

User.create!([{name: "Nico",
              email: "nico@test.com",
              password: "12345678",
              deleted_at: Time.current},
             ])

User.create!([{name: "Juanma",
              email: "juanma@test.com",
              password: "12345678"},
             ])

User.create!([{name: "Santi",
              email: "santi@test.com",
              password: "12345678"},
             ])
