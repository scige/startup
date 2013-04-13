# coding: utf-8

class Admin::ProductsController < ApplicationController
    before_filter :authenticate_super!

    def index
        @products = Product.page(params[:page])
    end

    def new
        @product = Product.new
        @categories = Category.all
        @districts = District.all
    end

    def edit
        @product = Product.find(params[:id])
        @categories = Category.all
        @districts = District.all
    end

    def create
        if params[:preview]
            preview
        else
            temp = params[:product].dup
            category_id = temp[:category_id].to_i
            district_id = temp[:district_id].to_i
            temp.delete(:category_id)
            temp.delete(:district_id)
            @product = Product.new(temp)
            @product.category = Category.find_by_id(category_id)
            @product.district = District.find_by_id(district_id)
            if @product.save
                redirect_to admin_products_url
            else
                @categories = Category.all
                @districts = District.all
                render "new"
            end
        end
    end

    def update
        if params[:preview]
            preview
        else
            @product = Product.find(params[:id])
            temp = params[:product].dup
            category_id = temp[:category_id].to_i
            district_id = temp[:district_id].to_i
            temp.delete(:category_id)
            temp.delete(:district_id)
            @product.category = Category.find_by_id(category_id)
            @product.district = District.find_by_id(district_id)
            if @product.update_attributes(temp)
                redirect_to admin_products_url
            else
                # 恢复上次其他的修改
                @categories = Category.all
                @districts = District.all
                render "edit"
            end
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_url
    end

    private

    def preview
        temp = params[:product].dup
        category_id = temp[:category_id].to_i
        district_id = temp[:district_id].to_i
        temp.delete(:category_id)
        temp.delete(:district_id)
        @product = Product.new(temp)
        @product.category = Category.find_by_id(category_id)
        @product.district = District.find_by_id(district_id)
        render "products/show"
    end
end
