module FiltersHelper
    def filter_title(action_name, id)
        if action_name == "category"
            Category.find(id.to_i).cn_name
        elsif action_name == "district"
            District.find(id.to_i).cn_name
        end
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
end
