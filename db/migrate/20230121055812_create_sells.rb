class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.integer :quantity
      t.decimal :total
      t.string :day
      t.string :book_name
      t.timestamps
    end
  end
end
