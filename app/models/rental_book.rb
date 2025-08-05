# app/models/rental_book.rb

class RentalBook < ApplicationRecord
  belongs_to :rental
  belongs_to :book
end