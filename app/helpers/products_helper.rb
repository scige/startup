module ProductsHelper
    def integer_of_value(value)
        value.to_i
    end

    def discount
        "%.1f" % (@product.sale_price / @product.original_price * 10)
    end

    def save_price
        @product.original_price - @product.sale_price
    end
end
