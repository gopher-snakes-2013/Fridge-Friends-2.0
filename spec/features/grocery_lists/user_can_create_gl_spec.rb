require 'spec_helper'

feature 'Fridge creator may create Grocery List' do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario 'with valid params' do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    click_on "Home Fridge"
    fill_in "grocery_list_title", with: 'Grocery List'
    click_on 'Create Grocery List for Fridge'
    expect(page).to have_content 'Grocery List successfully created!'
  end
end

