WITH
monthly_sales AS (
  SELECT
      category1
      -- 項目別売上を計算
    , SUM(amount) AS amount
  FROM
    purchase_log
)