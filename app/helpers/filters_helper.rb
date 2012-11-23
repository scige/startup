module FiltersHelper
    def filter_title(action_name, id)
        if action_name == "category"
            Category.find(id.to_i).cn_name
        elsif action_name == "district"
            District.find(id.to_i).cn_name
        end
    end
end
