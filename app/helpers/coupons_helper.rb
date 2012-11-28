# coding: utf-8

module CouponsHelper
    def coupon_status_string(status)
        case status
        when COUPON_STATUS_UNUSE
            "未使用"
        when COUPON_STATUS_USED
            "已使用"
        end
    end
end
