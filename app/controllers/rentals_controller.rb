class RentalsController < ApplicationController
  before_action :authenticate_user

  def create

    book = Book.find(params[:book_id])

    if book.status == '貸出可能'

      due_date = Date.today + book.default_due_days.days

      ActiveRecord::Base.transaction do

        rental = Rental.create!(user: current_user)

        RentalBook.create!(rental: rental, book: book, rented_at: Time.now, due_date: due_date)

        book.update!(status: '貸出中')
      end

      
    else
      redirect_to book_path(book), alert: "この本は現在貸出中です。"
    end
  end

  private

  # ログインしているかチェックするメソッド（仮）
  def authenticate_user
    unless logged_in?
      redirect_to login_path, alert: "ログインしてください。"
    end
  end
end
