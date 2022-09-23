class ManageController < ApplicationController
  def index
    books = Book.all
    @book_data = books.map do |book|
      copies = book.get_copies
      loaned_out = copies.filter {|copy| !copy.borrower.nil?}
      overdue = loaned_out.filter{|copy| copy.due_date < Time.now}
      {:id => book.id, :title => book.title, :author => book.author,
       :total_copies => copies.length,
       :available => copies.length-loaned_out.length,
       :loaned_out => loaned_out.length,
       :overdue => overdue.length}
    end
  end
  end

  #
  # tr>
  # <th><%= book.id %></th>
  #           <th><%= book.title %></th>
  # <th><%= book.author %></th>
  #           <th><%= book.total_copies %></th>
  # <th><%= book.available %></th>
  #           <th><%= book.loaned_out %></th>
  # <th><%= book.overdue %></th>
