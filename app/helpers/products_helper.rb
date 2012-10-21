module ProductsHelper
    def integer_sale_price
        "%d" % @product.sale_price
    end

    def discount
        "%.1f" % (@product.sale_price / @product.original_price * 10)
    end

    def save_price
        @product.original_price - @product.sale_price
    end
end
