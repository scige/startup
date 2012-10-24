class Admin::ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        if params[:preview]
            preview
        else
            @product = Product.new(params[:product])
            if @product.save
                redirect_to :action => "index"
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
            if @product.update_attributes(params[:product])
                redirect_to :action => "index"
            else
                render :action => "edit"
            end
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to :action => "index"
    end

    private #TODO: 似乎不生效?
    def preview
        @product = Product.new(params[:product])
        render :action => "preview"
    end
end
