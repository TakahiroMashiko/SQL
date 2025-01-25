WITH
stats AS (
SELECT
    -- 金額の最大値
    5000 AS max_price
    -- 金額の最小値
  , 0 AS min_price
FROM
    purchase_detail_log
)