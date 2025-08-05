class User < ApplicationRecord
     has_secure_password

     has_many :rentals
  has_many :rental_books, through: :rentals
  has_many :books, through: :rental_books

 
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # パスワードのバリデーションを追加
  validates :password,
            presence: true, # パスワードが空でないこと
            length: { minimum: 8 }, # 8文字以上
            format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]+\z/,
                      message: "は8文字以上で、大文字、小文字、数字をそれぞれ1つ以上含める必要があります" },
            on: :create
end
