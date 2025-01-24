WITH
stats AS (
SELECT
    -- 金額の最大値
    5000 AS max_price
FROM
    purchase_detail_log
)