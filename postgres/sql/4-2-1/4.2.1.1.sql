WITH
sub_category_amount AS (
  -- 小カテゴリの売上を集計する
  SELECT
    category AS category
    , sub_category AS sub_category
    , SUM(price) AS amount

  FROM
    purchase_detail_log
  GROUP BY
    category, sub,category
)
, category_amount AS (
  -- 大カテゴリの売上を集計する
  SELECT
    category
    , 'all' AS sub_category
)