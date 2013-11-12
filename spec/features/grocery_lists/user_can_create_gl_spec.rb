require 'spec_helper'

feature 'Fridge creator may create Grocery List' do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

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

feature 'Fridge friend may create Grocery List' do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

  scenario 'with valid params' do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "test fridge"
    click_on "Add Fridge"
    click_link "test fridge"
    fill_in 'user_email', with: user.email
    click_on 'Add Fridge Friend'
    click_link 'logout'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on 'Sign in'
    click_on 'test fridge'
    fill_in "grocery_list_title", with: 'fancy grocery list'
    click_on 'Create Grocery List for Fridge'
    expect(page).to have_content 'fancy grocery list successfully created!'
  end
end