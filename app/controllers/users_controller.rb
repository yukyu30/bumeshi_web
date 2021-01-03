class UsersController < ApplicationController
  def signin
    @omniauth = User.from_omniauth(request.env["omniauth.auth"]) #googleから返された情報を格納
    @user = User.find_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
    if user.name.present?
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to new_user_path
    end
  end
  
  def new
    @user = User.new
  end

  def create
    if @user.update_attributes(user_params)
      session[:user_id] = @user.id
      redirect_to mypage_path
    else
      redirect_to create_user_path
    end
  end
  

  def me
    @reviews = Review.where(user_id: @current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name)
  end
  
end
