class AddIndexToJoin < ActiveRecord::Migration
  def change
    add_index :fridges_users, [:user_id, :fridge_id], :unique => true
  end
end
