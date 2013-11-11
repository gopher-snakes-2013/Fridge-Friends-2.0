require 'spec_helper'

describe ItemsController do
  let!(:user) { User.create(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:fridge) { Fridge.create(name: "Food Titanic", creator_id: user.id) }
  let!(:item) { Item.create(name: "Milk", category: "Dairy", fridge_id: fridge.id, creator_id: user.id) }

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

  it "#destroy" do
    expect {
      post :destroy, fridge_id: item.fridge_id, id: item.id
    }.to change{ Item.count }.by(-1)
  end
end
