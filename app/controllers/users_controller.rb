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
  
end

