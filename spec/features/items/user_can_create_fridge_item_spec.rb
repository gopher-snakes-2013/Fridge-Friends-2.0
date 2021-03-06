require 'spec_helper'

feature "User can create fridge item" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

  scenario "when they are the original fridge creator" do
    signup_user(user)
    fill_in "fridge_name", with: "Bob's Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Bob's Home Fridge"
    click_link "Bob's Home Fridge"
    fill_in 'item_name', with: 'fridge item'
    select('Other', :from => 'item_category')
    click_on 'Add Item to Fridge'
    expect(page).to have_content "fridge item"
  end

  scenario "when they are not the original fridge creator", js: true do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "test fridge"
    click_on "Add Fridge"
    click_link "test fridge"
    fill_in 'user_email', with: user.email
    click_on 'Add Fridge Friend'
    expect(page).to have_content "User successfully added as a friend."
    click_link 'logout'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content "test fridge"
    click_link "test fridge"
    fill_in "item_name", with: "fridge item"
    select('Other', :from => 'item_category')
    click_on 'Add Item to Fridge'
    expect(page).to have_content "Purchased By: Carter1"
  end

  scenario "with valid item name and category" do
    signup_user(user)
    fill_in "fridge_name", with: "Bob's Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Bob's Home Fridge"
    click_link "Bob's Home Fridge"
    fill_in 'item_name', with: 'fridge item'
    select('Other', :from => 'item_category')
    click_on 'Add Item to Fridge'
    expect(page).to have_content "fridge item"
  end
end


feature "User cannot create fridge item" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "with invalid item name and category" do
    signup_user(user)
    fill_in "fridge_name", with: "Bob's Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Bob's Home Fridge"
    click_link "Bob's Home Fridge"
    select('Other', :from => 'item_category')
    click_on 'Add Item to Fridge'
    expect(page).to have_content "Name can't be blank"
  end
end
