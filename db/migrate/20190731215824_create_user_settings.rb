class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.string :key
      t.string :value
      t.references :user, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
