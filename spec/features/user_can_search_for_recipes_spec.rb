require 'spec_helper'

feature "User can search for recipes" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "with valid search terms" do
    signup_user(user)
    visit recipe_queries_path
    fill_in "recipe_query_terms", with: "salmon"
    click_on "Find Recipes"
    expect(page).to have_content "Search terms: salmon"
  end

  scenario "with invalid search terms" do
    signup_user(user)
    visit recipe_queries_path
    fill_in "recipe_query_terms", with: ""
    click_on "Find Recipes"
    expect(page).not_to have_content "Search terms:"
  end

end
