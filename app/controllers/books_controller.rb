class BooksController < ApplicationController

  def index
    @books = Book
    @books = @books.by_author(params[:author])
    @books = @books.by_category(params[:category])
    @books = @books.order(:id)
  end

  def show
    @book=Book.find(params[:id])
  end

end
