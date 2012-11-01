module Admin::ProductsHelper
    def form_action(form_type)
        if form_type == "edit"
            return {:url => admin_product_path(@product), :method => :put}
        else
            return {:url => admin_products_path, :method => :post}
        end
    end

    def dashboard_select_products(dashboard_select)
        if dashboard_select == "products"
            return "current"
        end
            return ""
    end

    def dashboard_select_shops(dashboard_select)
        if dashboard_select == "shops"
            return "current"
        end
            return ""
    end

    def dashboard_select_users(dashboard_select)
        if dashboard_select == "users"
            return "current"
        end
            return ""
    end

    def dashboard_select_orders(dashboard_select)
        if dashboard_select == "orders"
            return "current"
        end
            return ""
    end

    def dashboard_select_categorys(dashboard_select)
        if dashboard_select == "categorys"
            return "current"
        end
            return ""
    end

    def dashboard_select_districts(dashboard_select)
        if dashboard_select == "districts"
            return "current"
        end
            return ""
    end
end
