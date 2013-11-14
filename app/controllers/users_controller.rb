class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      flash[:sign_up_errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def update_text_alerts
    current_user.update_attributes(opted_in: params[:user][:opted_in])
    redirect_to fridge_path(params[:id])
  end
end

