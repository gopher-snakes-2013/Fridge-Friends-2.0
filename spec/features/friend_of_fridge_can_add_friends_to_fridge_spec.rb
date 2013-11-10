require 'spec_helper'

feature "friend of fridge (that is not creator of fridge) can add" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '407-774-9393', customer_id: '123456788') }

  let!(:user_2) { User.new(name: 'Bob', email: 'bob@example.com', password: 'bobpassword', phone_number: '234-533-4354', customer_id: '123456788') }

  let!(:user_3) { User.new(name: 'Boring', email: 'boring@test.com', password: 'boring', phone_number: '000-000-0000', customer_id: '000000000') }

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
    click_link 'logout'
    signup_user(user_3)
    click_link 'logout'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content "test fridge"
    click_link "test fridge"
    fill_in 'user_email', with: user_3.email
    click_on 'Sign up'
    expect(page).to have_content "User successfully added as a friend."
  end
end