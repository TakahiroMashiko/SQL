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
  GROUP BY
    category1
)
, sales_composition_ratio AS (
  SELECT
      category1
    , amount

    -- 構成比:　100.0 * 項目別売上 / 全体売上
    , 100.0 * amount / SUM(amount) OVER() AS composition_ratio

    -- 構成比累計：　100.0 * 項目別累計売上 / 全体売上
    , 100.0 * SUM(amount) OVER(ORDER BY amount DESC)
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    / SUM(amount) OVER() AS cumulative_raito
  FROM
    monthly_sales
)
SELECT
    *
  -- 構成比累計の範囲に応じてランク付け
  , CASE
      WHEN cumulative_raito BETWEEN  0 ABD 70 THEN 'A'
    END AS abc_rank
FROM
  sales_composition_ratio
ORDER BY
  amount DESC
;