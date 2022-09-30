SELECT
-- ■ PostgreSQL, Hive, BigQueryの場合は、
-- CURRENT_DATE定数やCURRENT_TIMESTAMP定数が利用できる
  CURRENT_DATE AS dt
, CURRENT_TIMESTAMP AS stamp

-- ■ Hive, BigQuery, SparkSQLの場合は、
-- CURRENT_DATE()関数やCURRENT_TIMESTAMP()関数が利用できる
--  CURRENT_DATE() AS dt
--  , CURRENT_TIMESTAMP() AS stamp
;