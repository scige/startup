class CategoriesController < ApplicationController
    def show
        @categories = Category.all

        category = Category.find_by_id(params[:id])
        @products = category.products
    end

    def today
        @categories = Category.all
        # TODO: 选择当前的Product
        @products = Product.all
    end
end
