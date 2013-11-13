class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      #REVIEW: you shouldn't be redirecting, you should be rendering
      render :new
    end
  end
  # create a new action and route for opting in
  def update
    # REVIEW: you're handling the happy path only.
    current_user.update_attributes(opted_in: params[:user][:opted_in])
    redirect_to fridge_path(params[:id])
  end
end

