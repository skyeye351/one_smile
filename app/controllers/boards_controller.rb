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
        redirect_to boards_path, success: t("defaults.flash_message.created", item: Board.model_name.human)
        else
        flash.now[:error] = t("defaults.flash_message.not_created", item: Board.model_name.human)
        render :new, status: :unprocessable_entity
        end
    end

    def show
        # 全てのユーザーが詳細画面にアクセスできる
        @board = Board.find(params[:id])
        @comment = Comment.new
        @comments = @board.comments.includes(:user).order(created_at: :desc)
    end

    def edit
        # ログインしたユーザーのみ編集できる
        @board = current_user.boards.find(params[:id])
    end

    def update
        @board = current_user.boards.find(params[:id])
        if @board.update(board_params)
            redirect_to board_path(@board), success: t("defaults.flash_message.updated", item: Board.model_name.human)
        else
            flash.now[:error] = t("defaults.flash_message.not_updated", item: Board.model_name.human)
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to boards_path, success: t("defaults.flash_message.deleted", item: Board.model_name.human), status: :see_other
    end

    private

    def board_params
        params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
    end
end
