class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def details
    @book = Book.find_by_id(params[:id])
    if @book.nil? then
      @book = Book.new
      @book.title = "ERROR"
      @book.isbn = "-1"
    end
    puts(Book.inspect)
    @copies = @book.get_copies
    available_stock = @copies.filter {|copy| copy.borrower.nil? }.length

    @stock_message = if available_stock == 0
                       "<p><strong class='has-text-danger'>No copies in stock</strong></p>"
                     else
                       "<p>#{available_stock} cop#{available_stock > 1 ? 'ies' : 'y'} available to borrow</p>"
                     end
  end
end
