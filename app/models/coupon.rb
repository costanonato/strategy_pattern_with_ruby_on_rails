class Coupon < ApplicationRecord
  enum discount_type: [:percentage, :fixed]
  
  attr_accessor :discount_calculator

  def calculate_discount_for(amount)
    discount = discount_calculator.calculate(amount, self)
    is_applicable = discount > 0

    return is_applicable, discount
  end
end
