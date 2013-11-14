require 'spec_helper'

feature "User can delete recipe" do
  before(:each) do
    visit root_path
  end

  let!(:user) { User.new(name: 'Carter1', email: 'carter11@example.com', password: 'password', phone_number: '360-584-4437', customer_id: '123456788') }
  let!(:fridge) { Fridge.create(name: "Home Fridge", creator_id: user.id) }

  scenario "when they click on Delete Recipe" do
    signup_user(user)
    fill_in "fridge_name", with: "Bob's Home Fridge"
    click_on "Add Fridge"
    expect(page).to have_content "Bob's Home Fridge"
    click_link "Bob's Home Fridge"
    click_on 'Find Recipes'
    fill_in "recipe_query_terms", with: "butternut"
    click_on "Find Recipes"
    click_link 'Honey Thyme Roasted Butternut Squash'
    click_on "Save Recipe"
    expect(page).to have_content "Recipe Saved"
    visit recipe_queries_path
    click_on "Delete Recipe"
    expect(page).to_not have_content "Honey Thyme Roasted Butternut Squash"
  end
end