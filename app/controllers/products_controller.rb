class ProductsController < ApplicationController
    def show
        @product = Product.find_by_id(params[:id])
        @hot_products = Product.find(:all, 
                                     :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}",
                                     :order => "updated_at DESC",
                                     :limit => 5)
    end
end
