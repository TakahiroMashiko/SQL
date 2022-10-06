-- 文字列から日付型/タイムスタンプ型に変換する
SELECT
  -- ■ PostgreSQL, Hive, BigQuery, SparkSQLのすべてで、
  -- 「CAST(value AS type)」の形式が使用できる
  CAST('2016-01-30' AS date) AS dt
;