class RemoveTimestampsRecipesUsers < ActiveRecord::Migration
  def change
    change_column :recipes_users, :created_at, :datetime, :null => true
    change_column :recipes_users, :updated_at, :datetime, :null => true
  end
end
