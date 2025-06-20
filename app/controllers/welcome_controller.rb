class WelcomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @latest_boards = Board.order(created_at: :desc).limit(6)
  end
end
