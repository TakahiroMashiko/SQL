SELECT
  dt
  , COUNT(*) AS purchase_count
  , SUM(purchase_amount) AS total_amount
FROM
  purchase_log
;