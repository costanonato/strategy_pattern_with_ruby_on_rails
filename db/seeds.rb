Order.create!(
  subtotal: 300,
  total: 300
)

Order.create!(
  subtotal: 700,
  total: 700
)

Order.create!(
  subtotal: 1000,
  total: 1000
)

Coupon.create!(
  discount_type: :percentage,
  discount_value: 10,
  code: '10PercentOff'
)