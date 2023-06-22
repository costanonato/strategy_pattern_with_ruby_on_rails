class OrdersController < ApplicationController

  def apply_discount_coupon
    order = Order.find(params[:id])
    coupon = Coupon.find_by!(code: params[:coupon_code])
    order.apply_discount_coupon!(coupon)

    render json: order
  rescue => error
    render json: { error: error.to_s }
  end

end