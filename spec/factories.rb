FactoryGirl.define do
  factory :user do
    name 'Carter1'
    email 'carter11@example.com'
    password 'password'
    phone_number '407-774-9393'
    customer_id '123456788'
  end

  factory :valid_user, :parent => :user do
    # name     'somename'
    email    'a@b.com'
    password 'somepassword'
  end

  factory :invalid_user, :parent => :user do
    # some other attrs
  end
end