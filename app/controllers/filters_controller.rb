class FiltersController < ApplicationController
    def today
        @categories = Category.all
        @districts = District.all
        # TODO: 选择日期为今天的Product
        @products = Product.all
    end

    def category
        @categories = Category.all
        @districts = District.all

        category = Category.find_by_id(params[:id])
        @products = category.products
    end

    def district
        @categories = Category.all
        @districts = District.all

        district = District.find_by_id(params[:id])
        @products = district.products
    end
end
