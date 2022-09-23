class Copy < ApplicationRecord
  def get_due_date
    return due_date.strftime("%d/%m/%Y %l:%M %p")
  end
end
