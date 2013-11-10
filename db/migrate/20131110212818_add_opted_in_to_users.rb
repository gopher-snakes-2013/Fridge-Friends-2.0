class AddOptedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :opted_in, :boolean
  end
end
