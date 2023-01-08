SELECT
  dt
  , ad_id

  -- CASE式で分母が0の場合を分岐して、0除算を避ける方法
  , CASE
      WHEN impressions > 0 THEN 100.0 * clicks / impressions
    END AS ctr_as_percent_by_case

    -- 分母が0の場合はNULLに変換し、0除算を避ける方法
    -- ■ PostgresSQL, Redshift, BigQuery, SparkSQLの場合、NULLIF関数が利用できる
    , 100.0 * clicks / NULLIF(impressions, 0) AS ctr_as_percent_by_null
    -- ■ Hiveの場合、NULLIFの代わりにCASE式を用いる
    -- , 100 * clicks
    -- / CASE WHEN impressions = 0 THEN NULL ELSE impressions END
FROM
  advertising_stats
ORDER BY
  dt, ad_id
;