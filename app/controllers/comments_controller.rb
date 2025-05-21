class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board), success: t("defaults.flash_message.comment", item: Comment.model_name.human)
    else
      flash[:error] = t("defaults.flash_message.not_comment", item: Comment.model_name.human)
      redirect_to board_path(@comment.board)
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
