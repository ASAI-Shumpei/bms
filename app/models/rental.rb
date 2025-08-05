# app/models/rental.rb

class Rental < ApplicationRecord
  belongs_to :user
  has_many :rental_books, dependent: :destroy
  has_many :books, through: :rental_books
end