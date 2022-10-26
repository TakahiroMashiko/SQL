SELECT
  stamp
  -- ■PostgreSQL, Hive, Redshift, SparkSQLでは、substring関数が利用できる
  , substring(stamp, 1, 4) AS year
  , substring(stamp, 6, 2) AS month
FROM
;