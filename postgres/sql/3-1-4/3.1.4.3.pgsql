SELECT
  stamp
  -- PostgresSQL, Redshift, BigQueryの場合、EXTRACT関数が利用できる
  , EXTRACT(YEAR FROM stamp) AS year
  , EXTRACT(MONTH FROM stamp) AS month

FROM
  (SELECT CAST('2016-01-30 12:00:00' AS timestamp) AS stamp) AS timestamp
;