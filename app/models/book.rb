class Book < ApplicationRecord
    has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
    has_one_attached :cover_image

     has_many :rental_books
  has_many :rentals, through: :rental_books
  has_many :users, through: :rentals
end
