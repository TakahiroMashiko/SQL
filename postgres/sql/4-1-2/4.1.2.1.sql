SELECT
  dt
  , SUM(purchase_amount) AS total_amount

  -- 直近の最大7日間の平均を計算する
  , AVG(SUM(purchase_amount))
    OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
    AS seven_day_avg

  -- 厳密に直近の7日間の平均を計算する
  , CASE
      WHEN
        7 = COUNT(*)
        OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      THEN
        AVG(SUM(purchase_amount))
  END
  AS seven_day_avg_strict
FROM purchase_log
GROUP BY dt
ORDER BY dt
;