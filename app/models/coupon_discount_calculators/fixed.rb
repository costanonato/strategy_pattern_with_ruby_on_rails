module CouponDiscountCalculators
  class Fixed < CouponDiscountCalculator
    # Full discount is applied for amounts >= 2000
    # 1/4 discount is applied for amounts >= 1500
    # No discount is applied for amounts < 1500
    def calculate(amount, coupon)    
      full_discount = coupon.discount_value

      return full_discount   if amount >= 2000
      return full_discount/4 if amount >= 1500
      return 0
    end
  end
end