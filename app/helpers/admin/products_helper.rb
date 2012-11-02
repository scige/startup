module Admin::ProductsHelper
    def form_action(form_type)
        if form_type == "edit"
            return {:url => admin_product_path(@product), :method => :put}
        else
            return {:url => admin_products_path, :method => :post}
        end
    end
end
