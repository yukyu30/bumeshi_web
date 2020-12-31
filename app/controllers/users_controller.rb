class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user]);
  end

  def create
    user = User.new(user_params) #ユーザを入力された情報をもとに作成
    if user.save #userを正常に登録できた場合
      session[:user_id] = user.id; #セッションにuser_idを保存
      redirect_to mypage_path #mypageへリダイレクト
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end
  def auth
    
  end
  def me
    @reviews = Review.where(user_id: session[:user_id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
