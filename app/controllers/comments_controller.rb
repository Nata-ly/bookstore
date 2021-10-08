class CommentsController < ApplicationController
  before_action :authenticate_user!, :onlu => [:create]

  def create
    @book = Book.find(params[:book_id])
    comment = @book.comments.new(comment_params)
    set_user(comment)
    if comment.save
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    if current_user.id == @comment.user_id
    @comment.destroy
    redirect_to book_path(@book)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :estimate)
  end

  def set_user(comment)
    comment.author = current_user.username
    comment.user_id = current_user.id
    comment
  end

end
