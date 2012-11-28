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
        allproducts = category.products
        @products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF
        end
    end

    def district
        @categories = Category.all
        @districts = District.all

        district = District.find_by_id(params[:id])
        allproducts = district.products
        @products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF
        end
    end
end
