WITH
stats AS (
SELECT
    -- 金額の最大値 + 1
    MAX(price) + 1 AS max_price
    -- 金額の最小値
  , MIN(price) AS min_price
    -- 金額の範囲 + 1 (実数)
  , MAX(price) + 1 - MIN(price) AS range_price
FROM
  purchase_detail_log
)