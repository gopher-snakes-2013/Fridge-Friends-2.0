require 'spec_helper'

describe FridgesController do
  let!(:fridge) { Fridge.create(name: "Food Titanic") }

  it "#index" do
    get :index
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new fridge with valid params" do
      expect {
        post :create, fridge: { name: "Food Titanic" }
      }.to change{ Fridge.count }.by(1)
    end

    it "should not create a new fridge without valid params" do
      expect {
        post :create, fridge: { name: "" }
      }.not_to change{ Fridge.count }
    end
  end

  it "#show" do
    get :show, id: fridge.id
    response.status.should eq(200)
  end

  it "#destroy" do
    expect {
      post :destroy, id: fridge.id
    }.to change{ Fridge.count }.by(-1)
  end
end