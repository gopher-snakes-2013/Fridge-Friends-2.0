require 'spec_helper'

describe FridgesController do
  let!(:user) { User.create(email: "steven@steven.com", password: "password", name: "Steven") }
  let!(:user2) { User.create(email: "annie@steven.com", password: "password", name: "Annie") }
  let!(:fridge) { Fridge.create(name: "Food Titanic") }

  xit "#index" do
    get :index
    response.status.should eq(200)
  end

  context "#create" do
    xit "creates a new fridge with valid params" do
      expect {
        post :create, fridge: { name: "Food Titanic" }
      }.to change{ Fridge.count }.by(1)
    end

    xit "should not create a new fridge without valid params" do
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

  context "#add_user" do
    xit "adds an existing user to the fridge with a valid email address" do
      expect {
        post :add_user, params = { id: fridge.id, user: { email: user2.email } }
        p fridge.users.count
      }.to change { fridge.users.count }.by(1)
    end
  end
end