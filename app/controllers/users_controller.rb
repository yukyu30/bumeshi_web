class UsersController < ApplicationController
  def signin
    @user = User.from_omniauth(request.env["omniauth.auth"]) 
    if @user.save
      if @user.name.nil?
        session[:provider] = @user.provider
        session[:uid] = @user.uid
        redirect_to new_user_path
      else
        session[:user_id] = @user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
   
  end
  
  def new
    @user = User.find_by(provider: session[:provider], uid: session[:uid])
  end

  def create
    user = User.find_by(provider: session[:provider], uid: session[:uid])
    user.update(user_params)
    if user.save #userを正常に登録できた場合
      session[:user_id] = user.id
      redirect_to mypage_path #セッションを作成
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end
  
  def update
    user = User.find_by(provider: @userinfo.provider, uid: @userinfo.uid)
    user.update(user_params)
    redirect_back fallback_location: mypage_path
  end
  def auth
    
  end
  def me
    @reviews = Review.where(user_id: @current_user.id)
    
  end
  def enter
  
  end
  def aikotoba
    if params[:key] == "yukyu30"
      redirect_to '/auth/google_oauth2'
    else
      redirect_to root_path
      flash[:notice] = "エラー"
    end
  end
  private
  def user_params
    params.require(:user).permit(:name)
  end
end
