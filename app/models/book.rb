class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :sells

  after_create_commit :set_book_graph

  def lastest_sells
    array = Array.new

    sells.each_with_index do |sell, index|
      array.push([index, sell.quantity])
    end

    array
  end

  private

  def set_book_graph
    broadcast_append_to("books_custom_channel", partial: 'dashboard/graphs/book', locals: { book: self }, target: 'books_section_graphs')
  end
end
