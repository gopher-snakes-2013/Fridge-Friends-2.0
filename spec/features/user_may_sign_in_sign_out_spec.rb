require 'spec_helper'

feature "User may log in and log out" do
  before(:each) do
    visit root_path
  end
  describe "User" do
    let(:user) { FactoryGirl.create(:user) }
    scenario "with email and password", js: true do
      # let!(:user) { name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '407-774-9393', customer_id: '123456788' }
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_on "Sign in"

      # expect(current_path).to eq session_path
      expect(page).to have_content "logout"
      expect(page).to have_content "Fridges"
    end
  end
end