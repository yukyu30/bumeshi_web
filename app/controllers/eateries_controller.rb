class EateriesController < ApplicationController
    
    def index
        @eateries = Eatery.page(params[:page])
    end
    def new
        if params[:name].present? and params[:address].present?
            addres = params[:address]
            addres.slice!(0..9)
            @eatery = Eatery.new(
                name: params[:name], 
                addres: addres, 
                latitude: params[:latitude], 
                longitude: params[:longitude],
                parking: nil,
                url: params[:url],
                gnav_id: params[:gnav_id],
            )
        else
            @eatery = Eatery.new(flash[:eatery])
        end
    end
    def find
        @query = params[:query]
        @gnavi_eateries = gnavi_freeword_search(@query)
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
        params.require(:eatery).permit(:name, :addres, :latitude, :longitude, :parking, :url, :gnav_id, payment_ids: [], category_ids: [])
    end
    def gnavi_freeword_search(querey)
        q = querey
        key=ENV['API_KEY']
        params = URI.encode_www_form({keyid: key, freeword: q})
        uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?#{params}")
        json = Net::HTTP.get(uri)
        result = JSON(json)
        
        return result["rest"]
    end
end