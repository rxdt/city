class UsersController < ApplicationController
  before_filter :authenticate_user!

  def create_ad
    redirect_to user_steps_path
  end

  private 

  def set_user
    @user = current_user
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
