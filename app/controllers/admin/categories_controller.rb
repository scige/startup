class Admin::CategoriesController < ApplicationController
    before_filter :authenticate_user!
    #before_filter :require_admin_user

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
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_url
    end
end
