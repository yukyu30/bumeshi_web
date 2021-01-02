class UsersController < ApplicationController
  def signin
    @auth = request.env["omniauth.auth"]
    @user = User.find_by(provider: @auth.provider, uid: @auth.uid) #ユーザーの認証
    if @user.present? 
      session[:user_id] = @user.id
     
      redirect_to mypage_path
    else
      redirect_to new_user_path
    end
  end
  
  def new
    @user = User.new(flash[:user]);
  end

  def create
    @user = User.new(user_params(@auth))
    if user.save #userを正常に登録できた場合
      redirect_to mypage_path #セッションを作成
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end
  
  def update
    user = User.find(@current_user.id)
    user.update(user_params)
    redirect_back fallback_location: mypage_path
  end
  def auth
    
  end
  def me
    @reviews = Review.where(user_id: @current_user.id)
  end
  
  private
  def user_params(auth)
    params.require(:user).permit(:name).merge(provider: auth.provider, uid: auth.uid, image: auth.image, oauth_token: auth.credentials.token, oauth_expires_at: Time.at(auth.credentials.expires_at))
  end
end
