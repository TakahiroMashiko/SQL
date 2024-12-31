WITH
stats AS (
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
    ) +1 AS bucket
  FROM
    purchase_detail_log, stats
)