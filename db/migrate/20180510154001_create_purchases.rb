class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.integer :amount
      t.boolean :paid
      t.references :user, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
