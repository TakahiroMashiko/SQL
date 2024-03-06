SELECT
  dt
  , COUNT(*) AS purchase_count
  , SUM(purchase_amount) AS total_amount
  , AVG(purchase_amount) AS avg_amount
FROM
  purchase_log
;