class BooksController < ApplicationController

  def index
    @books = Book
    @books = @books.where(author_id: params[:author]) if params[:author]
    @books = @books.order(:id)
  end

  def show
    @book=Book.find(params[:id])
  end

end
