User.create!([{name: "Fede",
              email: "fede@test.com",
              password: "12345678",
              admin: true,
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             ])

User.create!([{name: "Caco",
              email: "caco@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"every_day", "language"=>"en"}},
             ])

User.create!([{name: "Nico",
              email: "nico@test.com",
              password: "12345678",
              deleted_at: Time.current,
              settings: {"email_notification_enabled"=>false, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             ])

User.create!([{name: "Juanma",
              email: "juanma@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"every_week", "language"=>"es"}},
             ])

User.create!([{name: "Santi",
              email: "santi@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             ])

User.create!([{name: "Juli",
              email: "juli@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"every_week", "language"=>"es"}},
             ])
