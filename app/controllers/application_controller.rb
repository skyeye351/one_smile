class ApplicationController < ActionController::Base
  before_action :require_login

  add_flash_types :success, :error

  private

  def not_authenticated
    redirect_to login_path, error: t("defaults.flash_message.require_login")
  end
end
