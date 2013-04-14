class ProductsController < ApplicationController
    def index
        @categories = Category.all
        @districts = District.all
        @products = Product.where(:status=>PRODUCT_STATUS_ON_SHELF).order("updated_at DESC").page(params[:page])
        @carousel_products = @products.shuffle[0...8]
    end

    def show
        @product = Product.find_by_id(params[:id])
        # 按购买人数排序，同时增加一些随机
        @hot_products = Product.find(:all, 
                                     :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}",
                                     :order => "updated_at DESC",
                                     :limit => 5)
    end
end
