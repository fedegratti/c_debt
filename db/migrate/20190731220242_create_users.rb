class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.string :provider
      t.string :uid
      t.string :image
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
