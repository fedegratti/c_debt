class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.belongs_to :user, index: true

      t.string :title
      t.integer :amount
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
