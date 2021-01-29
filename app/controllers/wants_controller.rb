class WantsController < ApplicationController
    def new
        if session[:user_id].blank?
            flash[:alert] = "ユーザー情報が確認できません"
            redirect_to "/users/enter"
        else
           @want= Want.new(flash[:want])
        end
    end
  
    def create
        want = Want.new(want_params)
        if want.save
            flash[:notice] = "リストに追加しました🔖"
            redirect_to wants_list_path
        else
            flash[:want] = want
            flash[:error_messages] = want.errors.full_messages
            redirect_back fallback_location: root_path
        end
    end
    def index
        @wants = Want.where(user_id: @current_user.id)
    end
    
    def public
         @wants = Want.where(user_id: params[:id])
         @user = User.find(params[:id])
    end
    def destroy
        want= Want.find(params[:id])
        want.delete
        flash[:notice] = "行きたいお店を削除しました🗑"
        redirect_back fallback_location:  root_path
    end
    
    private
    
    def want_params
        params.require(:want).permit(:eatery_name, :eatery_addres, :memo).merge(user_id: @current_user.id)
    end
end
