class Sell < ApplicationRecord
  # scope :last_sells
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

  def self.last_sells
    array = Array.new

    Sell.all.each_with_index do |sell, index|
      array.push([index, sell.quantity])
    end

    array
  end
end
