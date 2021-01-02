class UsersController < ApplicationController
  def signin
    @omiauth = request.env["omniauth.auth"] #googleから返された情報を格納
    user = User.find_by(provider: @omiauth.provider, uid: @omiauth.uid)
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
    @user = User.from_omniauth(request.env["omniauth.auth"], params[:name])
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
    params.require(:user).permit(:name).(uid: @auth.uid, image: @auth.image, oauth_token: @auth.credentials.token, oauth_expires_at: Time.at(@auth.credentials.expires_at))
  end
end
