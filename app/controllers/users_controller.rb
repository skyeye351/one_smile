class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to edit_profile_path, success: t("defaults.flash_message.created", item: User.model_name.human)
    else
      flash.now[:error] = t("defaults.flash_message.not_created", item: User.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
