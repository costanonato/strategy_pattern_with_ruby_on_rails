class Order < ApplicationRecord

  def apply_discount_coupon!(coupon)
    is_applicable, discount = coupon.calculate_discount_for(self.subtotal)

    if is_applicable
      self.coupon_id = coupon.id
      self.total = [self.subtotal - discount, 0].max
      self.save!
    else
      raise 'this coupon is not valid for this Order'
    end
  end

end
