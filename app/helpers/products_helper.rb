# coding: utf-8

module ProductsHelper
    def get_format_time(time)
        time != nil ? time.strftime('%Y年%m月%d日') : ""
    end
end
