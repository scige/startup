class CategoriesController < ApplicationController
    def show
        @categories = Category.all

        category = Category.find_by_id(params[:id])
        @products = category.products
    end
end
