class AddCreatorIdToFridges < ActiveRecord::Migration
  def change
    add_column :fridges, :creator_id, :integer
  end
end
