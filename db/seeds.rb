@user_fede = User.create!({name: "Fede",
              email: "fede@test.com",
              password: "12345678",
              admin: true,
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             )

@user_caco = User.create!({name: "Caco",
              email: "caco@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"every_day", "language"=>"en"}},
             )

User.create!({name: "Nico",
              email: "nico@test.com",
              password: "12345678",
              deleted_at: Time.current,
              settings: {"email_notification_enabled"=>false, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             )

@user_juanma = User.create!({name: "Juanma",
              email: "juanma@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"every_week", "language"=>"es"}},
             )

@user_santi = User.create!({name: "Santi",
              email: "santi@test.com",
              password: "12345678",
              settings: {"email_notification_enabled"=>true, "email_notification_frecuency"=>"instantly", "language"=>"en"}},
             )

Expense.create!([{name: "Monitor", amount: 2000, user_id: @user_fede.id},
                 {name: "Memoria", amount: 900, user_id: @user_fede.id, paid: true}])

Debt.create!([{title: "Bar viernes", amount: 200, owner_id: @user_caco.id, user_id: @user_fede.id},
              {title: "Bar viernes", amount: 200, owner_id: @user_juanma.id, user_id: @user_fede.id},
              {title: "Gimnasio", amount: 80, owner_id: @user_santi.id, user_id: @user_fede.id, paid: true},
              {title: "Cafe", amount: 50, owner_id: @user_fede.id, user_id: @user_caco.id},])
