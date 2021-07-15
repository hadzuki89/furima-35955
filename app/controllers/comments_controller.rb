class CommentsController < ApplicationController

  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'message_channel', content: @comment, user: @comment.user
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
