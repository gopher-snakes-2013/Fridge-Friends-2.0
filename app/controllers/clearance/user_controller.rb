class UsersController < Clearance::UsersController

  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)
    phone_number = user_params.delete(:phone_number)
    customer_id = user_params.delete(:customer_id)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
      user.phone_number = phone_number
      user.customer_id = customer_id
    end
  end

end