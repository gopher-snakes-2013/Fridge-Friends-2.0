require 'spec_helper'

feature "Visting home page" do
  context "when not logged in" do
    scenario "They see Sign in or Sign up" do
      visit "/"
      expect(page).to have_content "Sign in"
      expect(page).to have_content "Sign up"
    end
    scenario "They do not see logout" do
      visit "/"
      expect(page).to_not have_content "logout"
    end
  end
end