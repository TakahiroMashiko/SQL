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
  FROM purchase_detail_log
)