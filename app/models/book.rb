class Book < ApplicationRecord
  def get_copies
    @copies = []
    Copy.find_each(batch_size: 50) do |copy|
      if copy.book_id == id.to_i then
        @copies.push(copy)
      end
    end
    @copies
  end

end
