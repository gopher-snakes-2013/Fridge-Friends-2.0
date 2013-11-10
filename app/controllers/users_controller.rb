class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
      redirect_to sign_up_path
    end
  end

  def update
    user = current_user
    user.update_attributes(opted_in: params[:user][:opted_in])
    redirect_to fridge_path(params[:id])
  end
end

