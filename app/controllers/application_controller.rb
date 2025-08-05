class ApplicationController < ActionController::Base
  private # ★private以下に記述されているか確認

  # 現在ログインしているユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ユーザーがログインしているかどうかを返す
  def logged_in? # ★ここが「logged_in?」になっているか確認
    !current_user.nil?
  end

  # ログインしていないユーザーをログインページにリダイレクトする
  def require_login
    unless logged_in?
      flash[:alert] = "ログインしてください。"
      redirect_to login_path
    end
  end

  # これらのメソッドをビュー（.html.erbファイル）でも使えるようにする
  helper_method :current_user, :logged_in?
end