class Manager::BooksController < ApplicationController
  layout 'manager'

  def index
    @books = Book.all
  end

end
