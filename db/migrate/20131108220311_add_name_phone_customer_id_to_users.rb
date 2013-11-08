class AddNamePhoneCustomerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :customer_id, :string
  end
end
