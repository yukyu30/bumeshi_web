class EateriesController < ApplicationController
    def index
        @eatery = Eatery.all
    end
    def new
        @eatery = Eatery.new
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
    
    private
    
    def eatery_params
        params.require(:eatery).permit(:name, :addres, nil, nil, :category, :payment, :parking)
    end
        
end