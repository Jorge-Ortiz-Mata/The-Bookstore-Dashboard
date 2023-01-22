module BooksHelper
  def revenue_from_sells
    array = Array.new

    Book.all.each do |book|
      array.push([book.name, book.sells.sum(:total).round(2)])
    end

    array
  end
end
