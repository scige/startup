class FiltersController < ApplicationController
    def today
        @categories = Category.all
        @districts = District.all
        today_date = Time.now.strftime('%Y-%m-%d')
        @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF} and Date(updated_at)='#{today_date}'").order("updated_at DESC").page(params[:page])
    end

    def select
        @categories = Category.all
        @districts = District.all

        # params[:c_id] == all时，category为nil
        # params[:d_id] == all时，district为nil
        category = Category.find_by_id(params[:c_id])
        district = District.find_by_id(params[:d_id])

        if category and district
          @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF} and category_id = #{category.id} and district_id = #{district.id}").order("updated_at DESC").page(params[:page])
        elsif category and !district
          @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF} and category_id = #{category.id}").order("updated_at DESC").page(params[:page])
        elsif !category and district
          @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF} and district_id = #{district.id}").order("updated_at DESC").page(params[:page])
        else
          @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF}").order("updated_at DESC").page(params[:page])
        end
    end

    def search
        # 使用多个字段进行搜索，并且对输入Query做切分用AND语法搜索
        @products = Product.where("status=#{PRODUCT_STATUS_ON_SHELF} and title like '%s'" % "%#{params[:keywords]}%").order("updated_at DESC").page(params[:page])
    end
end
