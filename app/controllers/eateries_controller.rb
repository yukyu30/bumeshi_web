class EateriesController < ApplicationController
    def index
    end
    def new
        @eatery = Eatery.new
    end
end