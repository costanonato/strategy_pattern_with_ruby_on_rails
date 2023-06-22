class OrdersController < ApplicationController

  def apply_discount_coupon
    order = Order.find(params[:id])
    coupon = Coupon.find_by!(code: params[:coupon_code])
    set_discount_calculator_for(coupon)
    order.apply_discount_coupon!(coupon)

    render json: order
  rescue => error
    render json: { error: error.to_s }
  end

  private

  def set_discount_calculator_for(coupon)
    if coupon.created_at.to_date.to_s == '2022-11-25'
      calculator = CouponDiscountCalculators::BlackFriday2022.new
    elsif coupon.percentage?
      calculator = CouponDiscountCalculators::Percentage.new
    elsif coupon.fixed?
      calculator = CouponDiscountCalculators::Fixed.new
    end

    coupon.discount_calculator = calculator
  end
end