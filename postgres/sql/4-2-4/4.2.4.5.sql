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
, purchase_log_with_bucket AS (
  SELECT
      price
    , min_price
      -- 正規化金額:　対象の金額から最小金額を引く
    , price - min_price AS diff
      -- 階級範囲:　金額範囲を階級数で割る
    , 1.0 * range_price / bucket_num AS bucket_range
      -- 階級の判定: FLOOR（正規化金額 / 階級範囲）
    , FLOOR(
        1.0 * (price - min_price)
        / (1.0 * range_price / backet_num)
    ) +1 AS bucket
    
    -- PostgreSQLの組み込み関数を使う場合
    -- width_bucket(price, min_price, max_price, bucket_num) AS bucket
  FROM
      purchase_detail_log, stats
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
GROUP BY
    bucket, min_price, bucket_range
ORDER BY
    bucket