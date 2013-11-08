class RemoveTimeStampsFromJoinTable < ActiveRecord::Migration
  def up
    change_column :fridges_users, :created_at, :datetime, :null => true
    change_column :fridges_users, :updated_at, :datetime, :null => true
  end

  def down
    change_column :fridges_users, :created_at, :datetime, :null => false
    change_column :fridges_users, :updated_at, :datetime, :null => false
  end
end
