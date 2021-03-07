class ReviewsController < ApplicationController
    def new
        @eatery = Eatery.find(params[:eatery_id])
        if session[:user_id].blank?
            flash[:alert] = "コメントをするためにはユーザー登録をお願いします"
            redirect_to "/users/enter"
        else
            @eatery_id = params[:eatery_id]
            @user_id = session[:user_id]
            @review = Review.new(flash[:review])
        end
    end
  
    def create
        review = Review.new(review_params)
        if review.save
            flash[:notice] = "レビューを投稿しました✏"
            redirect_to review.eatery
        else
            flash[:review] = review
            flash[:error_messages] = review.errors.full_messages
            redirect_back fallback_location: review.eatery
        end
    end
    
    def destroy
        review = Review.find(params[:id])
        review.image.purge;
        review.delete
        flash[:notice] = "レビューを削除しました🗑"
        redirect_back fallback_location: review.eatery
    end
    
    private
    
    def review_params
        params.require(:review).permit(:eatery_id, :price, :rate, :comment, :image).merge(user_id: @current_user.id)
    end
end