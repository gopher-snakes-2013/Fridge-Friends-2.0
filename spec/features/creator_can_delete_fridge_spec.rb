require 'spec_helper'

feature "User can delete a fridge" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

  scenario "when they are the original fridge creator" do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Home Fridge"
    click_on "Delete Fridge"
    expect(page).to_not have_content "Home Fridge"
  end

  scenario "but not when they are not the original fridge creator" do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "Bob's Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Bob's Home Fridge"
    click_link "Bob's Home Fridge"
    fill_in 'user_email', with: user.email
    click_on 'Add Fridge Friend'
    click_link "logout"
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on "Sign in"
    expect(page).to_not have_content "Delete Fridge"
  end
end


