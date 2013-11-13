require 'spec_helper'

feature 'Fridge creator' do
 before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario 'can remove an item from a grocery list' do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    click_on "Home Fridge"
    fill_in "grocery_list_title", with: 'My Fancy List'
    click_on 'Create Grocery List for Fridge'
    click_on 'Options'
    click_link 'My Fancy List'
    fill_in 'item_name', with: 'Test Cheese'
    select('Dairy', from: 'item_category')
    click_on 'Add Item to Grocery List'
    click_on 'Delete Item'
    expect(page).to_not have_content 'Test Cheese'
  end

end