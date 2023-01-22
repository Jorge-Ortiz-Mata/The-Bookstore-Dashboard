class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :sells

  def lastest_sells
    array = Array.new

    sells.each_with_index do |sell, index|
      array.push([index, sell.quantity])
    end

    array
  end
end
