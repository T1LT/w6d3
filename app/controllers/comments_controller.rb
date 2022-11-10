class CommentsController < ApplicationController
  def create
    new_comment = Comment.new(comment_params)
    if new_comment.save 
      render json: new_comment
    else
      render json: new_comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      redirect_to comments_url
    else
      render json: new_comment.errors.full_messages, status: 422
    end
  end

  def index
   if params.has_key?(:artwork_id)
    comments = Comment.where("artwork_id = (?)", params[:artwork_id])
   elsif params.has_key?(:author_id)
    comments = Comment.where("author_id = (?)", params[:author_id])
   else
    comments = Comment.all
   end
    render json: comments
  end



  private
  def comment_params
    params.require(:comment).permit(:artwork_id, :author_id, :body)
  end
end