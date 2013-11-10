FactoryGirl.define do
  factory :user do
    user_name 'Carter1'
    user_email 'carter11@example.com'
    user_password 'password'
    user_phone_number '360-584-4437'
    user_customer_id '123456788'
  end

  factory :valid_user, :parent => :user do
    # name     'somename'
    session_email    'carter11@example.com'
    session_password 'password'
  end

  factory :invalid_user, :parent => :user do
    # some other attrs
  end
end