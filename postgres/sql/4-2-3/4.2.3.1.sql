WITH
daily_category_amount as (
  SELECT
      dt
    , category
    -- ▪️ PostgreSQL, Hive, Redshift, SparkSQLの場合は下記
    -- ▪️ Bigqueryの場合、substringをsubstrに修正
    , substring(dt, 1, 4) AS year
    , substring(dt, 6, 2) AS month
    , substring(dt, 9, 2) AS date
    , SUM(price) AS amount
  FROM purchase_detail_log
  GROUP BY dt, category
)
, monthly_category_amount as (
  SELECT
      concat(year, '-', month) AS year_month
      -- ■ Redshiftの場合はconcat関数を組み合わせるか、||演算子を用いる
      -- concat(concat(year, '-'), month) AS year_month
      -- year || '-' || month AS year_month
    , category
    , SUM(amount) AS amount
  FROM
    daily_category_amount
   GROUP BY
    year, month, category
)
SELECT
    year_month
  , category

FROM
  monthly_category_amount