class UsersController < ApplicationController
  def signin
    @omniauth = User.convert_omniauth(request.env["omniauth.auth"]) #googleから返された情報を格納
    user = User.find_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
  

  def me
    @reviews = Review.where(user_id: @current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name).(provider: @omniauth["provider"], uid: @omniauth["uid"], image: @omniauth["image"], oauth_token: @omniauth["oauth_token"], oauth_expires_at: @omniauth["oauth_expires_at"])
  end
  
end
