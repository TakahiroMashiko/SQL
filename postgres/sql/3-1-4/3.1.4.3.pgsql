SELECT
  stamp
  -- PostgresSQL, Redshift, BigQueryの場合、Extract関数が利用できる
  , EXTRACT(YEAR FROM stamp) AS year

FROM
  (SELECT CAST('2016-01-30 12:00:00' AS timestamp) AS stamp) AS timestamp
;