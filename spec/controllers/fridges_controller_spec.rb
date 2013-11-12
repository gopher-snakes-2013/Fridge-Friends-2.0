require 'spec_helper'

describe FridgesController do
  let!(:user) { User.create(email: "steven@steven.com", password: "password", name: "Steven", phone_number: "360-584-4437") }
  let!(:user2) { User.create(email: "annie@annie.com", password: "password", name: "Annie") }
  let!(:fridge) { Fridge.create(name: "Home Fridge", creator_id: user.id) }

  it "#index" do
  sign_in_as(user)
    get :index
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new fridge with valid params" do
      sign_in_as(user)
      expect {
        post :create, fridge: { name: "Food Titanic" }
      }.to change{ Fridge.count }.by(1)
    end

    it "should not create a new fridge without valid params" do
      sign_in_as(user)
      expect {
        post :create, fridge: { name: "" }
      }.not_to change{ Fridge.count }
    end
  end

  it "#show" do
    get :show, id: fridge.id
    response.status.should eq(302)
  end

  it "#destroy" do
    sign_in_as(user)
    expect {
      post :destroy, id: fridge.id
    }.to change{ Fridge.count }.by(-1)
  end

  it "#add_user" do
    expect {
      post :add_user, id: fridge.id, user: { email: user.email }
    }.to change { fridge.users.count }.by(1)
  end

  context "#remove_user" do

    it "removes a user from a shared fridge" do
      sign_in_as(user2)
      fridge.users << user
      fridge.users << user2
      expect{
        post :remove_user,id: fridge.id
      }.to change { fridge.users.count }.from(2).to(1)
    end

    it 'removes a user from a shared fridge without deleting the fridge from the db' do
      sign_in_as(user2)
      fridge.users << user
      fridge.users << user2
      expect{
        post :remove_user,id: fridge.id
      }.to_not change { Fridge.count }
    end
  end
end