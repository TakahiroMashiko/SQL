SELECT
-- ■ PostgreSQL, Hive, BigQueryの場合は、
-- CURRENT_DATE定数やCURRENT_TIMESTAMP定数が利用できる
  CURRENT_DATE AS dt
, CURRENT_TIMESTAMP AS stamp

-- ■ Hive, BigQuery, SparkSQLの場合は、
-- CURRENT_DATE()関数やCURRENT_TIMESTAMP()関数が利用できる
--  CURRENT_DATE() AS dt
--  , CURRENT_TIMESTAMP() AS stamp

-- ■ Redshiftの場合は、現在の日付にCURRENT_DATE、現在のタイムスタンプにGETDATE()を用いる
--  CURRENT_DATE AS dt
--  , GETDATE() AS stamp

-- ■ PostgresSQLの場合、CURRENT_TIMESTAMPはタイムゾーン付きのタイムスタンプ型になる
-- タイムゾーンなしのタイムスタンプを取得したい場合は、LOCALTIMESTAMPを用いる
-- , LOCALTIMESTAMP AS stamp
;