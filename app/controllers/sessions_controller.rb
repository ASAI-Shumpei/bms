class SessionsController < ApplicationController
   def new
    # ログインフォームを表示するだけなので、アクション内に特別なロジックは不要
  end

  def create
    # フォームから送られたメールアドレスでユーザーを検索
    # downcaseはメールアドレスの大文字小文字を区別なく扱うため
    user = User.find_by(email: params[:session][:email])

    # ユーザーが存在し、かつパスワードが正しい場合
    if user && user.authenticate(params[:session][:password])
      log_in user # ユーザーをログインさせるヘルパーメソッドを呼び出し
      redirect_to user # ログイン後、ユーザーの詳細ページにリダイレクト
    else
      # ログイン失敗の場合、エラーメッセージを表示してフォームを再表示
      # flash.nowは、次のリクエストで消えるメッセージ
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています。'
      render :new, status: :unprocessable_entity # エラーコード422を返す
    end
  end

  def destroy
    log_out # ユーザーをログアウトさせるヘルパーメソッドを呼び出し
    redirect_to root_path, notice: "ログアウトしました。" # トップページにリダイレクト
  end

  private

  # ユーザーIDをセッションに保存してログイン状態にする
  def log_in(user)
    session[:user_id] = user.id
  end

  # セッションからユーザーIDを削除してログアウト状態にする
  def log_out
    session.delete(:user_id)
    @current_user = nil # @current_userもクリアする
  end
end
