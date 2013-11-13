require 'spec_helper'

feature "User can delete recipe" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }

  scenario "when they click on Delete Recipe" do
    signup_user(user)
    visit recipe_queries_path
    fill_in "recipe_query_terms", with: "butternut"
    click_on "Find Recipes"
    visit recipe_query_recipe_path(1,1)
    click_on "Add Recipe"
    expect(page).to have_content "Recipe Saved"
    visit recipe_queries_path
    click_on "Delete Recipe"
    expect(page).to_not have_content "Delete Recipe"
  end
end