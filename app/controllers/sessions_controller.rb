class SessionsController < ApplicationController
  def new
    @auth = request.env["omniauth.auth"]
    @user = User.find_by(provider: flash[:auth].provider, uid: flash[:auth].uid) #ユーザーの認証
    if @user.present? 
      redirect_to create_session_path #userが存在するのでログイン処理へ
    else
      redirect_to new_user_path
    end
  end
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
