module HomeHelper
    def compute_map_center_x(products)
        points = []
        products.each {|p| points << [p.pos_x, p.pos_y]}
        points.uniq!
        sum = 0
        points.each {|p| sum += p[0]}
        sum / points.size
    end

    def compute_map_center_y(products)
        points = []
        products.each {|p| points << [p.pos_x, p.pos_y]}
        points.uniq!
        sum = 0
        points.each {|p| sum += p[1]}
        sum / points.size
    end
end
