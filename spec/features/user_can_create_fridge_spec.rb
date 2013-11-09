require 'spec_helper'

feature "User can create a new fridge" do
  context "with valid Fridge name" do
    xscenario "User may create a Fridge" do

      visit "/"
      fill_in "Fridge Name", with: "Home Fridge"
      click_on "Add Fridge"
      expect(page).to have_content "Home Fridge"
    end
  end
end