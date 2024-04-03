WITH
daily_purchase AS (
  SELECT
    dt
  FROM purchase_log
  GROUP BY dt
)