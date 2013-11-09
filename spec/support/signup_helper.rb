module SignupHelper
  def signup_user(user)
    visit sign_up_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_name', with: user.name
    fill_in 'user_phone_number', with: user.phone_number
    click_button "Sign up"
  end
end

RSpec.configure do |config|
  config.include SignupHelper, :type => :feature
end