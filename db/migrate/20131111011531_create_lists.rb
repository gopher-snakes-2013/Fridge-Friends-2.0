class CreateLists < ActiveRecord::Migration
  def up
    create_table :grocery_lists do |t|
      t.integer :fridge_id
      t.string :store
      t.timestamps
    end
  end

  def down
    drop_table :grocery_lists
  end
end
