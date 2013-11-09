require 'spec_helper'

feature "User can delete a fridge" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '407-774-9393', customer_id: '123456788') }

  scenario "when they are the original fridge creator" do
    signup_user(user)
    fill_in "fridge_name", with: "Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Home Fridge"
    click_on "Delete Fridge"
    expect(page).to_not have_content "Home Fridge"
  end
end
