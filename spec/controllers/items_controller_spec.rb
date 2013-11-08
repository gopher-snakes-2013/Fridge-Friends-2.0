require 'spec_helper'

describe ItemsController do
  let!(:item) { Item.create(name: "Milk", category: "Dairy", fridge_id: 1) }

  it "#index" do
    get :index, fridge_id: item.fridge_id
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new item with valid params" do
      expect {
        post :create, fridge_id: item.fridge_id, item: { name: "Milk", category: "Dairy", fridge_id: 1 }
      }.to change{ Item.count }.by(1)
    end

    it "should not create a new item without valid params" do
      expect {
        post :create, fridge_id: item.fridge_id, item: { name: "" }
      }.not_to change{ Item.count }
    end
  end

  it "#show" do
    get :show, fridge_id: item.fridge_id, id: item.id
    response.status.should eq(200)
  end

  it "#destroy" do
    expect {
      post :destroy, fridge_id: item.fridge_id, id: item.id
    }.to change{ Item.count }.by(-1)
  end
end
