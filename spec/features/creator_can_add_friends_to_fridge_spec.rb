require 'spec_helper'

feature "Fridge creator can add" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '206-313-0520', customer_id: '123456788') }

  scenario "exisiting user as friend to fridge", js: true do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "test fridge"
    click_on "Add Fridge"
    click_link "test fridge"
    fill_in 'user_email', with: user.email
    click_on 'Sign up'
    expect(page).to have_content "User successfully added as a friend."
  end
end

feature "Fridge creator cannot add" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '206-313-0520', customer_id: '123456788') }

  scenario "user to fridge when already a friend of fridge", js: true do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "test fridge"
    click_on "Add Fridge"
    click_link "test fridge"
    fill_in 'user_email', with: user.email
    click_on 'Sign up'
    expect(page).to have_content "User successfully added as a friend."
    fill_in 'user_email', with: user.email
    click_on 'Sign up'
    expect(page).to have_content "User is already a friend of this fridge."
  end

  scenario "non-existant user to fridge", js: true do
    signup_user(user)
    click_link "logout"
    signup_user(user_2)
    fill_in "fridge_name", with: "test fridge"
    click_on "Add Fridge"
    click_link "test fridge"
    fill_in 'user_email', with: 'non_existant@example.com'
    click_on 'Sign up'
    expect(page).to have_content "User not found. Please try again."
  end
end