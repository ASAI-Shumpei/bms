class CreateRentalBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :rental_books do |t|
      t.references :rental, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :rented_at
      t.date :due_date
      t.datetime :returned_at

      t.timestamps
    end
  end
end
