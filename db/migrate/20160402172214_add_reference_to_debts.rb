class AddReferenceToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :purchase, index: true, foreign_key: true
  end
end
