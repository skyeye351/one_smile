class BoardsController < ApplicationController
    skip_before_action :require_login, only: %i[index]

    def index
        @boards = Board.includes(:user)
    end

    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
        redirect_to boards_path, success: t(".success")
        else
        flash.now[:danger] = t(".failure")
        render :new, status: :unprocessable_entity
        end
    end

    private

    def board_params
        params.require(:board).permit(:title, :body)
    end
end
