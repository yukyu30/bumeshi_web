class SessionsController < ApplicationController
  def new
    flash[:auth] = request.env["omniauth.auth"]
    @user = User.find_by(provider: session[:auth].provider, uid: session[:auth].uid) #ユーザーの認証
    if @user.present? 
      redirect_to create_session_path #userが存在するのでログイン処理へ
    else
      redirect_to new_user_path
    end
  end
  def create
    if @user.preset?
      session[:user_id] = @user.id
     
      redirect_to mypage_path
    else
      redirect_to new_session_path#ログインに失敗した場合のリダイレクト先
      flash[:notice] ="問題が発生しました。やり直ししてください"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
