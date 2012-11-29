class ProductsController < ApplicationController
    def show
        @product = Product.find_by_id(params[:id])
        # 按购买人数排序，同时增加一些随机
        @hot_products = Product.find(:all, 
                                     :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}",
                                     :order => "updated_at DESC",
                                     :limit => 5)
    end
end
