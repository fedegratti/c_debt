class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
