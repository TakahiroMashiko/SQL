SELECT
  dt
  -- 「年-月」を抽出する
  -- ■ PostgreSQL, Hive, Redshift, SparkSQLの場合、substringで「年-月」部分を抽出する
  , substring(dt, 1, 7) AS year_month
FROM
  purchase_log
;