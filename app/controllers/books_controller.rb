class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def details
    @book = Book.find_by_id(params[:id])
    @copies = []
    available_stock = 0
    Copy.find_each do |copy|
      if copy.book_id == params[:id].to_i then
        if copy.due_date.nil? then
          available_stock += 1
        else
          @copies.push(copy)
        end
      end
    end
    @stock_message = if available_stock == 0
                       "<p><strong class='has-text-danger'>Out of stock</strong></p>"
                     else
                       "<p>#{available_stock} cop#{available_stock > 1 ? 'ies' : 'y'} in stock</p>"
                     end
  end
end
