class Sell < ApplicationRecord
  belongs_to :book

  validates :quantity, presence: true
  validates :day, presence: true

  before_create :calculate_total

  DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  private

  def calculate_total
    book_price = book.price
    self.total = book_price * quantity
  end
end
