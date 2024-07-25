WITH
sub_category_amount AS (
  -- 小カテゴリの売上を集計する
  SELECT
    category as category
  FROM
    purchase_detail_log
)