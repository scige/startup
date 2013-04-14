class HomeController < ApplicationController
    def index
        @categories = Category.all
        @districts = District.all
        @products = Product.where(:status=>PRODUCT_STATUS_ON_SHELF).order("updated_at DESC").page(params[:page])
    end

    def map
        @products = Product.where(:status=>PRODUCT_STATUS_ON_SHELF).order("updated_at DESC").page(params[:page])
    end
end
