class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def details
    @book = Book.find_by_id(params[:id])
    @copies = Copy.where(id: params[:id])
  end
end
