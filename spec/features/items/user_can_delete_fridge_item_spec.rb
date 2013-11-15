require 'spec_helper'

feature "User can delete fridge item" do
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
    click_on 'Delete Item'
    expect(page).to_not have_content "fridge item"
  end

end
