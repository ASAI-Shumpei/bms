class RentalBooksController < ApplicationController
  before_action :authenticate_user

  def update
    # 返却対象のrental_bookレコードを取得
    rental_book = RentalBook.find(params[:id])

    # 貸出中のレコードであることを確認
    if rental_book.returned_at.nil?
      # トランザクション処理を開始
      ActiveRecord::Base.transaction do
        # 1. returned_atに現在の日時を設定
        rental_book.update!(returned_at: Time.now)

        # 2. 関連する本のstatusを「貸出可能」に更新
        rental_book.book.update!(status: '貸出可能')
      end

      redirect_to user_path(current_user), notice: "#{rental_book.book.title}を返却しました。"
    else
      # すでに返却されている場合はエラーメッセージを表示
      redirect_to user_path(current_user), alert: "この本はすでに返却されています。"
    end
  end

  private

  # ユーザーがログインしているか確認するメソッド（仮）
  def authenticate_user
    unless logged_in?
      redirect_to login_path, alert: "ログインしてください。"
    end
  end
end
