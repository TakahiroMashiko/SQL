WITH
stats as (
SELECT
    -- 金額の最大値
    MAX(price) AS max_price
    -- 金額の最小値
  , MIN(price) AS min_price
    -- 金額の範囲
  , MAX(price) - MIN(price) AS range_price
    --　階級数
  , 10 AS bucket_num
FROM
  purchase_detail_log
)