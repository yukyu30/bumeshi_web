class EateriesController < ApplicationController
    def index
        @eatery = Eatery.all
    end
    def new
        @eatery = Eatery.new
        @payment = Payment.all
    end
    def create
        eatery = Eatery.create(eatery_params)
        if eatery.save 
          redirect_to eateries_path
        else
          redirect_back fallback_location: root_path, flash: {
            eatery: eatery
          }

        end
    end
    
    def show
       @eatery = Eatery.find(params[:id])
    end
    
    def recent
       @eatery = Eatery.recent(5)
    end
    def search
        @query = params[:query]
        @eatery = Eatery.search(@query)
    end
    
    
    private
    
    def eatery_params
        params.require(:eatery).permit(:name, :addres, nil, nil, :category, :parking, payment_ids: [])
    end
        
end