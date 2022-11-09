SELECT
  purchase_id
  , amount
  , coupon
  , amount - coupon AS discount_amount1
FROM
  purchase_log_with_coupon
;