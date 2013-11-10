require 'spec_helper'

feature "User can create a new fridge" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "with valid fridge name" do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Home Fridge"
  end
end

feature "User cannot create a new fridge" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "with duplicate fridge name" do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Home Fridge"
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Name has already been taken"
  end
end