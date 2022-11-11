SELECT
  user_id
  -- ■ PostgresSQL, Hive, Redshift, BigQuery, SparkSQLのすべてでCONCAT関数が利用できる
  -- ただし、Redshiftの場合は2引数のみ対応
  , CONCAT(pref_name, city_name) AS pref_city

FROM
  mst_user_location
;