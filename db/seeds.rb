@user_fede = User.create!(
  {
    name: "Fede",
    email: "fede@test.com",
    password: "12345678",
    password_confirmation: "12345678",
    admin: true
  }
)

UserSetting.create!(key: 'email_notification_enabled', value: 'true', user: @user_fede)
UserSetting.create!(key: 'email_notification_frecuency', value: 'instantly', user: @user_fede)
UserSetting.create!(key: 'language', value: 'en', user: @user_fede)

@user_caco = User.create!({name: "Caco",
              email: "caco@test.com",
              password: "12345678",
              password_confirmation: "12345678"
             })

UserSetting.create!(key: 'email_notification_enabled', value: 'true', user: @user_caco)
UserSetting.create!(key: 'email_notification_frecuency', value: 'every_day', user: @user_caco)
UserSetting.create!(key: 'language', value: 'en', user: @user_caco)

@user_nico = User.create!({name: "Nico",
              email: "nico@test.com",
              password: "12345678",
              password_confirmation: "12345678",
              deleted_at: Time.current
             })

UserSetting.create!(key: 'email_notification_enabled', value: 'false', user: @user_nico)
UserSetting.create!(key: 'email_notification_frecuency', value: 'instantly', user: @user_nico)
UserSetting.create!(key: 'language', value: 'en', user: @user_nico)

@user_juanma = User.create!({name: "Juanma",
              email: "juanma@test.com",
              password: "12345678",
              password_confirmation: "12345678",
             })

UserSetting.create!(key: 'email_notification_enabled', value: 'true', user: @user_juanma)
UserSetting.create!(key: 'email_notification_frecuency', value: 'every_week', user: @user_juanma)
UserSetting.create!(key: 'language', value: 'es', user: @user_juanma)

@user_santi = User.create!({name: "Santi",
              email: "santi@test.com",
              password: "12345678",
              password_confirmation: "12345678"
              })

UserSetting.create!(key: 'email_notification_enabled', value: 'true', user: @user_santi)
UserSetting.create!(key: 'email_notification_frecuency', value: 'instantly', user: @user_santi)
UserSetting.create!(key: 'language', value: 'en', user: @user_santi)

Expense.create!([{name: "Monitor", amount: 2000, user_id: @user_fede.id},
                 {name: "Memoria", amount: 900, user_id: @user_fede.id, paid: true}])

Debt.create!([{title: "Bar viernes", amount: 200, owner_id: @user_caco.id, user_id: @user_fede.id},
              {title: "Bar viernes", amount: 200, owner_id: @user_juanma.id, user_id: @user_fede.id},
              {title: "Gimnasio", amount: 80, owner_id: @user_santi.id, user_id: @user_fede.id, paid: true},
              {title: "Cafe", amount: 50, owner_id: @user_fede.id, user_id: @user_caco.id},])
