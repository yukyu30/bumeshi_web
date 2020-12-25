class EateriesController < ApplicationController
    def index
        @eateries = Eatery.page(params[:page])
    end
    def new
        @eatery = Eatery.new(flash[:eatery])
    end
    def create
        eatery = Eatery.new(eatery_params)
        if eatery.save 
            flash[:notice] = "#{eatery.name}を登録しました！"
          redirect_to eateries_path
        else
          redirect_back fallback_location: root_path, flash: {
            eatery: eatery,
            error_messages: eatery.errors.full_messages
          }

        end
    end
    
    def show
       @eatery = Eatery.find(params[:id])
    end
    
    def recent
       @eateries = Eatery.recent(50).page(params[:page])
    end
    def search
        @query = params[:query]
        @eateries = Eatery.search(@query).page(params[:page])
    end
    
    private
    
    def eatery_params
        params.require(:eatery).permit(:name, :addres, nil, nil, :parking, payment_ids: [], category_ids: [])
    end
        
end