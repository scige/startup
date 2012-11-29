module HomeHelper
    def compute_map_center_x(products)
        sum = 0
        products.each {|p| sum += p.pos_x}
        sum / products.size
    end

    def compute_map_center_y(products)
        sum = 0
        products.each {|p| sum += p.pos_y}
        sum / products.size
    end
end
