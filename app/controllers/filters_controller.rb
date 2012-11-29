class FiltersController < ApplicationController
    def today
        @categories = Category.all
        @districts = District.all
        today_date = Time.now.strftime('%Y-%m-%d')
        logger.debug "[DEBUG] #{today_date}"
        @products = Product.find(:all, 
                                 :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}
                                                 and Date(updated_at)='#{today_date}'",
                                 :order => "updated_at DESC")
    end

    def category
        @categories = Category.all
        @districts = District.all

        category = Category.find_by_id(params[:id])
        allproducts = category.products
        @products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF
        end

        @products.sort! do |x, y|
            y.updated_at <=> x.updated_at
        end
    end

    def district
        @categories = Category.all
        @districts = District.all

        district = District.find_by_id(params[:id])
        allproducts = district.products
        @products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF
        end

        @products.sort! do |x, y|
            y.updated_at <=> x.updated_at
        end
    end
end
