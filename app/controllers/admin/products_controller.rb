# coding: utf-8

class Admin::ProductsController < ApplicationController
    before_filter :require_logined
    before_filter :require_admin_user

    def index
        @products = Product.all
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
            temp = params[:product]
            category = Category.find_by_id(temp[:category].to_i)
            district = District.find_by_id(temp[:district].to_i)
            # 分类或区域不正确，不保存
            if !category || !district
                temp[:category] = nil
                temp[:district] = nil
                @product = Product.new(temp)
                @categories = Category.all
                @districts = District.all
                render "new"
                return
            end

            temp[:category] = category
            temp[:district] = district
            @product = Product.new(temp)
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
            temp = params[:product]
            category = Category.find_by_id(temp[:category].to_i)
            district = District.find_by_id(temp[:district].to_i)
            # 分类或区域不正确，不更新
            if !category || !district
                # 恢复上次其他的修改
                temp[:category] = @product.category
                temp[:district] = @product.district
                @product = Product.new(temp)
                @categories = Category.all
                @districts = District.all
                render "edit"
                return
            end

            temp[:category] = category
            temp[:district] = district
            if @product.update_attributes(temp)
                redirect_to admin_products_url
            else
                # 恢复上次其他的修改
                temp[:category] = @product.category
                temp[:district] = @product.district
                @product = Product.new(temp)
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

    private #TODO: 似乎不生效?
    def preview
        temp = params[:product]
        category = Category.find_by_id(temp[:category].to_i)
        district = District.find_by_id(temp[:district].to_i)
        # 分类或区域不正确，跳到空的页面
        if !category || !district
            render :text => "Invaild Parameters!"
            return
        end
        temp[:category] = category
        temp[:district] = district
        @product = Product.new(temp)
        render "products/show"
    end
end
