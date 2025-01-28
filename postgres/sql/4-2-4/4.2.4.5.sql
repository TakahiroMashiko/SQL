WITH
stats AS (
SELECT
    -- 金額の最大値
    5000 AS max_price
    -- 金額の最小値
  , 0 AS min_price
    -- 金額の範囲
  , 5000 AS range_price
    -- 階級数
  , 10 AS bucket_num
FROM
    purchase_detail_log
)