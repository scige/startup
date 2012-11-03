# coding: utf-8

class Admin::ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
        @categories = Category.all
    end

    def edit
        @product = Product.find(params[:id])
        @categories = Category.all
    end

    def create
        if params[:preview]
            preview
        else
            temp = params[:product]
            category = Category.find_by_id(temp[:category].to_i)
            # 分类不正确，不保存
            if !category
                temp[:category] = nil
                @product = Product.new(temp)
                @categories = Category.all
                render :action => "new"
                return
            end

            temp[:category] = category
            @product = Product.new(temp)
            if @product.save
                redirect_to admin_products_url
            else
                @categories = Category.all
                render :action => "new"
            end
        end
    end

    def update
        if params[:preview]
            preview
        else
            @product = Product.find(params[:id])
            temp = params[:product]
            category = Category.find_by_id(temp[:category].to_i)
            # 分类不正确，不更新
            if !category
                # 恢复上次其他的修改
                temp[:category] = @product.category
                @product = Product.new(temp)
                @categories = Category.all
                render :action => "edit"
                return
            end

            temp[:category] = category
            if @product.update_attributes(temp)
                redirect_to admin_products_url
            else
                # 恢复上次其他的修改
                temp[:category] = @product.category
                @product = Product.new(temp)
                @categories = Category.all
                render :action => "edit"
            end
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_url
    end

    private #TODO: 似乎不生效?
    def preview
        temp = params[:product]
        temp[:category] = Category.new(:cn_name => temp[:category])
        @product = Product.new(temp)
        render "products/show"
    end
end
