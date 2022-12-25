SELECT
  dt
  , ad_id
  -- ■Hive, Redshift, BigQuery, SparkSQLの場合、
  -- 整数の割り算でも結果が自動的に実数へ変換される
  , clicks / impression AS ctr
  -- ■ PostgreSQLの場合、整数の割り算では小数点が切り捨てられてしまうので、明示的に型を変換する
  -- , CAST(clicks AS double precision) / impressions AS ctr
  -- 実数の定数を先頭で掛け算すると、暗黙的に型変換される
  , 100.0 * clicks /impressions AS ctr_as_percent
FROM
  advertising_stats
WHERE
  dt = '2017-04-01'
ORDER BY
  dt, ad_id
;