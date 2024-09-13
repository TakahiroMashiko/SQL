WITH
monthly_sales AS (
  SELECT
      category1
      -- 項目別売上を計算
    , SUM(amount) AS amount
  FROM
    purchase_log
  -- 対象1ヶ月間のログに絞り込む
  WHERE
    dt BETWEEN '2015-12-01' AND '2015-12-31'
)