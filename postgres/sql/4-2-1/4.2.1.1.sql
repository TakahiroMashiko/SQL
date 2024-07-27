WITH
sub_category_amount AS (
  -- 小カテゴリの売上を集計する
  SELECT
    category as category
    , sub_category as sub_category
    , SUM(price) as amount
  FROM
    purchase_detail_log
)