# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


5.times do
  book_price = rand(30.0..50.0)
  book = Book.create(name: Faker::Book.title, price: book_price)

  10.times do
    book.sells << Sell.create(quantity: rand(2..15), day: Sell::DAYS[rand(0..(Sell::DAYS.length))])
  end
end
