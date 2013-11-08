require 'spec_helper'

describe ItemsController do
  let!(:fridge) { Fridge.create(name: "Food Titanic") }
  let!(:item) { Item.create(name: "Milk", category: "Dairy", fridge_id: fridge.id) }

  context "#create" do
    it "creates a new item with valid params" do
      expect {
        post :create, fridge_id: item.fridge_id, item: { name: item.name, category: item.category, fridge_id: item.fridge_id }
      }.to change{ Item.count }.by(1)
    end

    it "should not create a new item without valid params" do
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
