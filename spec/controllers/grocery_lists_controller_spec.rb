require 'spec_helper'

describe GroceryListsController do

  let!(:params){{grocery_list: {title: 'Grocery List Title'}, fridge_id: 1}}
  let!(:invalid_params){{grocery_list: {title: ''}, fridge_id: 1}}
  let(:created_list){GroceryList.create(title: 'Grocery List Title', fridge_id: 2)}

  context '#create' do
    xit 'should create a new grocery list with valid params' do
      expect{
        post :create, params
      }.to change { GroceryList.count }.from(0).to(1)
    end

    xit 'should not create a new grocery list with invalid params' do
      expect{
        post :create, invalid_params
      }.to_not change { GroceryList.count }
    end
  end

  context '#destroy' do
    it 'should delete a given grocery list' do
      created_list
      expect{
        delete :destroy, fridge_id: created_list.fridge_id, id: created_list.id
      }.to change { GroceryList.count }.from(1).to(0)
    end
  end





end