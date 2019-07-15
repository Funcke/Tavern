class OrdersController < ApplicationController
    before_action :authorize
    def pay
        order = Order.find(params[:id])
        order.paid = true
        order.save
        redirect_to request.env['HTTP_REFERER']
    end

    def pay_group
        params[:orders].each do |p|
            order = Order.find(p)
            unless(order.nil?)
                order.paid = true
                order.save
            end
        end
        204
    end
end
