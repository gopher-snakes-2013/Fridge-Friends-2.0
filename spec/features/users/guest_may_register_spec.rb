require 'spec_helper'

feature "Guest may register" do
  before(:each) do
    visit root_path
  end

  scenario "with valid name, email, password, phone, customer id", js: true do
    click_on "Sign up"
    fill_in 'user_name', with: 'CarterS'
    fill_in 'user_email', with: 'carterS@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_phone_number', with: '407-774-9393'
    fill_in 'user_customer_id', with: '123456789'
    click_on "Sign up"
    expect(page).to have_content "logout"
    expect(page).to have_content "Fridges"
  end
end

feature "Guest may not register" do
  before(:each) do
    visit root_path
  end

  scenario "with invalid name, email, password, phone, customer id", js: true do
    click_on "Sign up"
    fill_in 'user_name', with: 'CarterS'
    fill_in 'user_email', with: 'carterS'
    fill_in 'user_password', with: 'password'
    fill_in 'user_phone_number', with: '407-774-9393'
    fill_in 'user_customer_id', with: '123456789'
    click_on "Sign up"
    expect(page).to have_content "Sign up"
  end
end