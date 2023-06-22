class Coupon < ApplicationRecord
  enum discount_type: [:percentage]

  # Calculates discount for a given amount.
  # Full discount is applied for amounts >= 1000
  # Half discount is applied for amounts >= 700
  # No discount is applied for amounts < 700
  def calculate_discount_for(amount)
    full_discount = (amount * self.discount_value) / 100

    return true, full_discount   if amount >= 1000
    return true, full_discount/2 if amount >= 700
    return false, 0
  end
end


