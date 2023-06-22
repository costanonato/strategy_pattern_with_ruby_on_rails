class Coupon < ApplicationRecord
  enum discount_type: [:percentage, :fixed]

  def calculate_discount_for(amount)
    discount = discount_calculator.calculate(amount, self)
    is_applicable = discount > 0

    return is_applicable, discount
  end

  private

  def discount_calculator
    if self.created_at.to_date.to_s == '2022-11-25'
      CouponDiscountCalculators::BlackFriday2022.new
    elsif self.percentage?
      CouponDiscountCalculators::Percentage.new
    elsif self.fixed?
      CouponDiscountCalculators::Fixed.new
    end
  end
end
