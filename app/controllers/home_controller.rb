class HomeController < ApplicationController
    def index
        @categories = Category.all
        @districts = District.all
        @products = Product.all
    end
end
