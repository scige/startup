class HomeController < ApplicationController
    def index
        @categories = Category.all
        @districts = District.all
        @products = Product.find(:all, :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}")
    end
end
