class CreateJoinTableRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships, :id => false do |t|
      t.references :user, :null => false
      t.references :friend, :null => false
    end

    # Adding the index can massively speed up join tables. Don't use the
    # unique if you allow duplicates.
    add_index(:relationships, [:user_id, :friend_id], :unique => true)
  end
end
