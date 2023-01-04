SELECT
  dt
  , ad_id

  -- CASE式で分母が0の場合を分岐して、0除算を避ける方法
  , CASE
      WHEN impressions > 0 THEN 100.0 * clicks / impressions
FROM
  advertising_stats
ORDER BY
  dt, ad_id
;