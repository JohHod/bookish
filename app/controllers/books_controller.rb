class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def details
    @book = Book.find_by_id(params[:id])
    @copies = []
    Copy.find_each do |copy|
      if copy.book_id == params[:id].to_i then @copies.push(copy) end
    end
    puts(@copies)
  end
end
