class Coupon < ApplicationRecord
  enum discount_type: [:percentage, :fixed]

  # Calculates discount for a given amount.
  def calculate_discount_for(amount)
    # [Percentage]
    # Full discount is applied for amounts >= 1000
    # Half discount is applied for amounts >= 700
    # No discount is applied for amounts < 700
    if self.percentage?
      full_discount = (amount * self.discount_value) / 100

      return true, full_discount   if amount >= 1000
      return true, full_discount/2 if amount >= 700
      return false, 0

    # [Fixed]
    # Full discount is applied for amounts >= 2000
    # 1/4 discount is applied for amounts >= 1500
    # No discount is applied for amounts < 1500
    elsif self.fixed?
      full_discount = self.discount_value

      return true, full_discount   if amount >= 2000
      return true, full_discount/4 if amount >= 1500
      return false, 0
    end
  end
end


