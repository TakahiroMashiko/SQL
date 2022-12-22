SELECT
  dt
  , ad_id
  -- Hive, Redshift, BigQuery, SparkSQLの場合、
  -- 整数の割り算でも結果が自動的に実数へ変換される
  , clicks / impression AS ctr

FROM
  advertising_stats
WHERE
  dt = '2017-04-01'
ORDER BY
  dt, ad_id
;