class CreateFridgesUsers < ActiveRecord::Migration
  def change
    create_table :fridges_users do |t|
      t.integer :fridge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
