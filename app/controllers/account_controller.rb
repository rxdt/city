class AccountController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user

  def edit
  end

  def update
    @user.update user_params
    render :edit
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    delete_password_if_unused
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :first_name,
                                 :last_name,
                                 :phone_office,
                                 :phone_home,
                                 :phone_mobile,
                                 :address_street,
                                 :address_city,
                                 :address_state,
                                 :address_zip)
  end

  def delete_password_if_unused
    return unless params[:user][:password].blank? &&
                  params[:user][:password_confirmation].blank?
    params[:user].delete 'password'
    params[:user].delete 'password_confirmation'
  end
end
