# coding: utf-8

module ArticlesHelper
    def get_all_format_time(time)
        time != nil ? time.strftime('%Y-%m-%d') : ""
    end
end
