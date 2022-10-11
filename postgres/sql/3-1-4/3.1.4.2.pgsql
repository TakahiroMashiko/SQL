-- 文字列から日付型/タイムスタンプ型に変換する
SELECT
  -- ■ PostgreSQL, Hive, BigQuery, SparkSQLのすべてで、
  -- 「CAST(value AS type)」の形式が使用できる
  CAST('2016-01-30' AS date) AS dt
  CAST('2016-01-30 12:00:00' AS timestamp) AS stamp

  -- ■ Hive, BigQueryの場合、「type(value)」の形式が利用できる
  -- date('2016-01-30') AS dt
  -- , timestamp('2016-01-30 12:00:00') AS stamp

  -- ■ PostgersSQL, Hive, BigQuery, SparkSQLのすべてで、
  -- 「type value」の形式が使用できる
  -- ※ ただし、valueは定数である必要があり、カラム名は指定できない
  -- date '2016-01-30' AS dt
  -- , timestamp '2016-01-30 12:00:00' AS stamp
;