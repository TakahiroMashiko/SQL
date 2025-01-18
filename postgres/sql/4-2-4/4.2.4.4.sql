WITH stats AS (
    SELECT
          -- 金額の最大値 + 1
          MAX(price) + 1 AS max_price
          -- 金額の最小値
        , MIN(price) AS min_price
          -- 金額の範囲 + 1 (実数)
        , MAX(price) + 1 - MIN(price) AS range_price
          -- 階級数
        , 10 AS bucket_num
    FROM
        purchase_detail_log
)
SELECT
      bucket
    -- 階級の下限と上限を計算する
    , min_price + bucket_range * (bucket - 1) AS lower_limit
    , min_price + bucket_range * bucket AS upper_limit
    -- 度数をカウントする
    , COUNT(price) AS num_purchase
    -- 合計金額を計算する
    , SUM(price) AS total_amount
FROM
    purchase_log_with_bucket