class BooksController < ApplicationController

  def index
    @books = Book
    @books = @books.where(author_id: params[:author]) if params[:author]
    @books = @books.where(category_id: params[:category]) if params[:category]
    @books = @books.order(:id)
  end

  def show
    @book=Book.find(params[:id])
  end

end
