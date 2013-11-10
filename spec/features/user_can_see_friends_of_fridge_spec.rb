require 'spec_helper'

feature 'User can friends of fridge' do
 before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '757-535-4412', customer_id: '123456788') }

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
    click_on 'Options'
    expect(page).to have_content "Carter1"
  end
end
