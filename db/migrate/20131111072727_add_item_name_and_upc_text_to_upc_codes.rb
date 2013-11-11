class AddItemNameAndUpcTextToUpcCodes < ActiveRecord::Migration
  def change
    add_column :upc_codes, :upc_text, :string
    add_column :upc_codes, :item_name, :string
  end
end
