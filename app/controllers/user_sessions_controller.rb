class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to boards_path, success: t(".success")
    else
      flash.now[:error] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:error] = t(".success")
    redirect_to root_path, status: :see_other
  end
end
