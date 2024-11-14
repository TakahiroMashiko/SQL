WITH
stats as (
SELECT
    -- 金額の最大値
    MAX(price) AS max_price
    -- 金額の最小値
  , MIN(price) AS min_price
FROM
  purchase_detail_log
)