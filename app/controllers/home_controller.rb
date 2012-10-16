class HomeController < ApplicationController
    def index
        @products = Product.all[0]
    end
end
