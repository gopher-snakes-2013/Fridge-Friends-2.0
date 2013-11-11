require 'spec_helper'

feature "User can delete recipe query" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "there is a query to delete" do
    signup_user(user)
    visit recipe_queries_path
    fill_in "recipe_query_terms", with: "salmon"
    click_on "Find Recipes"
    expect(page).to have_content "Search terms: salmon"
    visit recipe_queries_path
    click_on "Delete Search"
    expect(page).not_to have_content "salmon"
  end
end