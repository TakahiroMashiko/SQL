SELECT
  stamp
  -- ■ PostgreSQL, Hive, Redshift, SparkSQLでは、substring関数が利用できる
  , substring(stamp, 1, 4) AS year
  , substring(stamp, 6, 2) AS month
  , substring(stamp, 9, 2) AS day
  , substring(stamp, 12, 2) AS hour
  -- 年と月を同事に抽出する
  , substring(stamp, 1, 7) AS year_month

  -- ■ PostgreSQL, Hive, BigQuery, SparkSQLでは、substr関数が利用できる
  -- , substr(stamp, 1, 4) AS year
  -- , substr(stamp, 6, 2) AS month
  -- , substr(stamp, 9, 2) AS day
  -- , substr(stamp, 12, 2) AS hour
  -- , substr(stamp, 1, 7) AS year_month
FROM
  -- PostgreSQL, Redshiftの場合、文字列型としてtextが利用できる
  (SELECT CAST('2016-01-30 12:00:00' AS text) AS stamp) AS time
  -- Hive, BigQuery, SparkSQLの場合、文字列型としてstringを用いる
  -- (SELECT CAST('2016-01-30 12:00:00' AS string) AS stamp) AS time
;