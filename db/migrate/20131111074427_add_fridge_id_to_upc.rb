class AddFridgeIdToUpc < ActiveRecord::Migration
  def change
    add_column :upc_codes, :fridge_id, :integer
  end
end
