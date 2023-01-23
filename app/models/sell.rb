class Sell < ApplicationRecord
  belongs_to :book

  validates :quantity, presence: true
  validates :day, presence: true

  before_create :calculate_total

  after_create_commit :set_sells_graphs

  DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  private

  def calculate_total
    book_price = book.price
    self.total = book_price * quantity
  end

  def set_sells_graphs
    broadcast_replace_to("sells_custom_channel", partial: 'dashboard/graphs/days', locals: {}, target: 'days_section_chart')
  end
end
