class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.string  :category
      t.belongs_to  :fridge

      t.timestamps
    end
  end
end
