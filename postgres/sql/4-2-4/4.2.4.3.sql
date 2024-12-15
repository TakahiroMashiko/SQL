WITH
stats AS (
SELECT
    -- 金額の最大値 + 1
    MAX(price) + 1 AS max_price
FROM
  purchase_detail_log
)