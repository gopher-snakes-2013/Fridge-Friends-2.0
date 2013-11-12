class AddGroceryListIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :grocery_list_id, :integer
  end
end
