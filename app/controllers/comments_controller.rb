class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_action :find_comment, :only => [:edit, :update, :destroy]
  before_action :find_book, :only => [:create, :destroy]
  before_action :check_author_comment, :only => [:destroy, :edit, :update]

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
    @comment.destroy
    redirect_to book_path(@book)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :estimate)
  end

  def set_user(comment)
    comment.user_id = current_user.id
    comment
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def check_author_comment
    @comment.author == current_user.username ? true : false
  end
end
