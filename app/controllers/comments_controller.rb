class CommentsController < ApplicationController
  before_action :authenticate_user!, :onlu => [:create]

  def create
    @book = Book.find(params[:book_id])
    @book.comments.create(comment_params)
    redirect_to book_path(@book)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author, :estimate)
  end

end
