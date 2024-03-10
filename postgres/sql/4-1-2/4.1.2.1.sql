SELECT
  dt
  , SUM(purchase_amount) AS total_amount
FROM purchase_log
;