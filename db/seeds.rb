@user_fede = User.create!({name: "Fede",
              email: "fede@test.com",
              password: "12345678",
              admin: true,

             })

@user_caco = User.create!({name: "Caco",
              email: "caco@test.com",
              password: "12345678",
             })

User.create!({name: "Nico",
              email: "nico@test.com",
              password: "12345678",
              deleted_at: Time.current,
             })

@user_juanma = User.create!({name: "Juanma",
              email: "juanma@test.com",
              password: "12345678",
             })

@user_santi = User.create!({name: "Santi",
              email: "santi@test.com",
              password: "12345678",
             })

Expense.create!([{name: "Monitor", amount: 2000, user_id: @user_fede.id},
                 {name: "Memoria", amount: 900, user_id: @user_fede.id, paid: true}])

Debt.create!([{title: "Bar viernes", amount: 200, owner_id: @user_caco.id, user_id: @user_fede.id},
              {title: "Bar viernes", amount: 200, owner_id: @user_juanma.id, user_id: @user_fede.id},
              {title: "Gimnasio", amount: 80, owner_id: @user_santi.id, user_id: @user_fede.id, paid: true},
              {title: "Cafe", amount: 50, owner_id: @user_fede.id, user_id: @user_caco.id},])
