WITH
daily_category_amount as (
  SELECT
      dt
    , category
  FROM purchase_detail_log
)