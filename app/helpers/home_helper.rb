module HomeHelper
    def compute_map_center_x(products)
        points = []
        products.each {|p| points << p.pos_x}
        points.sort!
        (points[0] + points[-1]) / 2
    end

    def compute_map_center_y(products)
        points = []
        products.each {|p| points << p.pos_y}
        points.sort!
        (points[0] + points[-1]) / 2
    end

    def active_channel?(current_controller, current_action)
      controller_name == current_controller and action_name == current_action
    end
end
