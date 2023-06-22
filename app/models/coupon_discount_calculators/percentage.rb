module CouponDiscountCalculators
  class Percentage < CouponDiscountCalculator
    # Full discount is applied for amounts >= 1000
    # Half discount is applied for amounts >= 700
    # No discount is applied for amounts < 700
    def calculate(amount, coupon)   
      full_discount = (amount * coupon.discount_value) / 100

      return full_discount   if amount >= 1000
      return full_discount/2 if amount >= 700
      return 0
    end
  end
end