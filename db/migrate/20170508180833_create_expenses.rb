class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.integer :amount
      t.boolean :paid, default: false

      t.timestamps null: false
    end
  end
end
