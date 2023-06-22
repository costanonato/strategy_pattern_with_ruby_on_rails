module CouponDiscountCalculators
  class BlackFriday2022 < CouponDiscountCalculator
    # Full discount is applied for all amounts
    def calculate(amount, coupon)    
      if coupon.percentage?
        (amount * coupon.discount_value) / 100
      elsif coupon.fixed?
        coupon.discount_value
      end
    end
  end
end