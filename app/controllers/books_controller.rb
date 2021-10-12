class BooksController < ApplicationController

  def index
    @books = Book
    @books = @books.where('author LIKE ?', "\%#{params[:search_author]}\%") if params[:search_author]
    @books = @books.order(:id)
  end

  def show
    @book=Book.find(params[:id])
  end

end
