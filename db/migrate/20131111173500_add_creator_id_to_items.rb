class AddCreatorIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :creator_id, :integer
  end
end
