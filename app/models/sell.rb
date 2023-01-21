class Sell < ApplicationRecord
  validates :quantity, presence: true
  validates :day, presence: true
  validates :book_name, presence: true

  before_create :calculate_total

  DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  private

  def calculate_total
    book_price = Book.find_by(name: book_name).price
    self.total = book_price * quantity
  end
end
