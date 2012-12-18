module FiltersHelper
    def filter_title(c_id, d_id)
        condition = ""

        district = District.find_by_id(d_id)
        if district
          condition += district.cn_name
        end

        category = Category.find_by_id(c_id)
        if category
          condition += category.cn_name
        end

        return condition
    end

    def today_product_count
        today_date = Time.now.strftime('%Y-%m-%d')
        products = Product.find(:all, 
                                :conditions => "status=#{PRODUCT_STATUS_ON_SHELF}
                                                and Date(updated_at)='#{today_date}'",
                                :order => "updated_at DESC")
        products.size
    end

    def on_shelf_count(allproducts)
        products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF
        end
        products.size
    end

    def category_count(allproducts, id)
        district = District.find_by_id(id)
        products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF and
            (!district or product.district == district)
        end
        products.size
    end

    def district_count(allproducts, id)
        category = Category.find_by_id(id)
        products = allproducts.select do |product|
            product.status == PRODUCT_STATUS_ON_SHELF and
            (!category or product.category == category)
        end
        products.size
    end
end
