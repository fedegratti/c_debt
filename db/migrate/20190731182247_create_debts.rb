class CreateDebts < ActiveRecord::Migration[5.0]
  def change
    create_table :debts do |t|
      t.string :title
      t.integer :amount
      t.boolean :paid
      t.references :user, foreign_key: true
      t.references :owner, foreign_key: true
      t.references :purchase, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
