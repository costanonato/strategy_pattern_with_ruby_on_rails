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

########

Order.create!(
  subtotal: 2300,
  total: 2300
)

Order.create!(
  subtotal: 1700,
  total: 1700
)

Order.create!(
  subtotal: 1200,
  total: 1200
)

Coupon.create!(
  discount_type: :fixed,
  discount_value: 400,
  code: '400ContoOff'
)