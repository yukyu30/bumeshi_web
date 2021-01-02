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
    binding.pry
    @user = User.save_omniauth(@omniauth, params[:name])
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
  def user_params(**auth)
    params.require(:user).permit(:name).merge(provider: auth["provider"], uid: auth["uid"], image: auth["image"], oauth_token: auth["oauth_token"], oauth_expires_at: auth["oauth_expires_at"])
  end
  
end
