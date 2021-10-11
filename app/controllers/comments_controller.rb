class CommentsController < ApplicationController
  before_action :authenticate_user!, :onlu => [:create]
  before_action :find_comment, :only => [:edit, :update]
  before_action :find_book, :only => [:create, :destroy]

  def create
    comment = @book.comments.new(comment_params)
    set_user(comment)
    if comment.save
      redirect_to book_path(@book)
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to book_path(@comment.book_id), :notice => 'Комментарий изменен'
    else
      render 'edit'
    end
  end

  def destroy
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

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

end
