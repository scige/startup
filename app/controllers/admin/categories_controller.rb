class Admin::CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(params[:category])
        if @category.save
            redirect_to admin_categories_url
        else
            render "new"
        end
    end

    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(params[:category])
            redirect_to admin_categories_url
        else
            render "edit"
        end
    end

    def destroy
        # TODO: 该分类下没有商品才能删除
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_url
    end
end
