SELECT
  dt
  -- 「年-月」を抽出する
  -- ■ PostgreSQL, Hive, Redshift, SparkSQLの場合、substringで「年-月」部分を抽出する
  , substring(dt, 1, 7) AS year_month
  -- ■ PostgreSQL, Hive, BigQuery, SparkSQLの場合、substrが利用できる
  -- , substr(dt, 1, 7) AS year_month
  , SUM(purchase_amount) AS total_amount
  , SUM(SUM(purchase_amount))
    -- ■ PostgreSQL, Hive, Redshift, SparkSQLの場合は下記
    OVER(PARTITION BY substring(dt, 1, 7) ORDER BY dt ROWS UNBOUNDED PRECEDING)
FROM
  purchase_log
;