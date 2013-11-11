require 'spec_helper'

describe ItemsController do
  let!(:user) { User.create(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:fridge) { Fridge.create(name: "Food Titanic", creator_id: user.id) }
  let!(:pre_created_item) { Item.create(name: "Cheese", category: "Dairy", fridge_id: fridge.id, creator_id: 2) }
  let!(:item) { Item.new(name: "Milk", category: "Dairy", fridge_id: fridge.id, creator_id: user.id) }
  let! (:pre_created_list) { GroceryList.create(title: 'Grocery List', fridge_id: fridge.id) }
  context "#create" do

    it "creates a new item with valid params" do
      sign_in_as(user)
      expect {
        post :create, fridge_id: item.fridge_id, item: { name: item.name, category: item.category, fridge_id: item.fridge_id, creator_id: user.id }
      }.to change{ Item.count }.by(1)
    end

    it "should not create a new item without valid params" do
      sign_in_as(user)
      expect {
        post :create, fridge_id: item.fridge_id, item: { name: "" }
      }.not_to change{ Item.count }
    end
  end

  context '#destroy' do
    it "deletes an item" do
      expect {
        delete :destroy, fridge_id: pre_created_item.fridge_id, id: pre_created_item.id
      }.to change{ Item.count }.by(-1)
    end
  end

  context '#create_grocery_list_item' do
    it 'creates an item in a grocery list' do
      sign_in_as(user)
      expect{
        post :create_grocery_list_item, fridge_id: fridge.id, grocery_list_id: pre_created_list.id, item: {name: item.name, category: item.category, fridge_id: item.fridge_id, grocery_list_id: pre_created_list.id, creator_id: item.creator_id}
      }.to change { GroceryList.first.items.count }.by(1)
    end
  end

end
