# coding: utf-8

class Admin::ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        category = Category.new(:cn_name => "美食")
        @product = Product.new
        @product.category = category
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        if params[:preview]
            preview
        else
            temp = params[:product]
            category = Category.find_by_cn_name(temp[:category])
            # 分类不正确，不保存
            if !category
                temp[:category] = Category.new(:cn_name => temp[:category])
                @product = Product.new(temp)
                render :action => "new"
                return
            end

            temp[:category] = category
            @product = Product.new(temp)
            if @product.save
                redirect_to admin_products_url
            else
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
            category = Category.find_by_cn_name(temp[:category])
            # 分类不正确，不更新
            if !category
                # 下面的代码不行，why???
                #temp[:category] = Category.new(:cn_name => temp[:category])
                #@product = Product.new(temp)
                #logger.debug "[DEBUG] #{@product}"

                @product.category = Category.new(:cn_name => temp[:category])
                render :action => "edit"
                return
            end

            temp[:category] = category
            if @product.update_attributes(temp)
                redirect_to admin_products_url
            else
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
