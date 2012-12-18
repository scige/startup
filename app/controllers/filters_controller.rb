class FiltersController < ApplicationController
    def today
        @categories = Category.all
        @districts = District.all
        today_date = Time.now.strftime('%Y-%m-%d')
        @products = Product.find(:all, 
                                 :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}
                                                 and Date(updated_at)='#{today_date}'",
                                 :order => "updated_at DESC")
    end

    def select
        @categories = Category.all
        @districts = District.all

        # params[:c_id] == all时，category为nil
        # params[:d_id] == all时，district为nil
        category = Category.find_by_id(params[:c_id])
        district = District.find_by_id(params[:d_id])
        allproducts = Product.all
        @products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF and
            (!category or product.category == category) and
            (!district or product.district == district)
        end

        @products.sort! do |x, y|
            y.updated_at <=> x.updated_at
        end
    end

    def search
        # 使用多个字段进行搜索，并且对输入Query做切分用AND语法搜索
        @products = Product.find(:all, 
                                 :conditions => ("status=#{PRODUCT_STATUS_ON_SHELF}
                                                 and title like '%s'" % "%#{params[:keywords]}%"),
                                 :order => "updated_at DESC")
    end
end
