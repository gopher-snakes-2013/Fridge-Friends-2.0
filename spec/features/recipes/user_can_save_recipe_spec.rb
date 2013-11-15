require 'spec_helper'

feature "User can save recipe" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "user clicks on Add/Save Recipe" do
    signup_user(user)
    fill_in "fridge_name", with: "Test Fridge"
    click_on "Add Fridge"
    click_on "Test Fridge"
    visit recipe_queries_path
    fill_in "recipe_query_terms", with: "butternut"
    click_on "Find Recipes"
    visit recipe_query_recipe_path(1,1)
    click_on "Save Recipe"
    expect(page).to have_content "Recipe Saved"
  end
end
