SELECT
  stamp
  -- ■PostgreSQL, Hive, Redshift, SparkSQLでは、substring関数が利用できる
  , substring(stamp, 1, 4) AS year
  , substring(stamp, 6, 2) AS month
  , substring(stamp, 9, 2) AS day
  , substring(stamp, 12, 2) AS hour
  -- 年と月を同事に抽出する
  , substring(stamp, 1, 7) AS year_month
FROM
;