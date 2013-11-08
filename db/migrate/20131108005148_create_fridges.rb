class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name

      t.timestamps
    end
  end
end
