require 'spec_helper'

feature 'Fridge creator ' do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

  scenario 'can delete grocery list' do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    click_on "Home Fridge"
    fill_in "grocery_list_title", with: 'My Fancy List'
    click_on 'Create Grocery List for Fridge'
    click_on 'Options'
    click_link 'Delete Grocery List'
    click_on 'Options'
    expect(page).to_not have_content 'My fancy List'
  end
end