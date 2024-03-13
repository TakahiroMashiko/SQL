SELECT
  dt
  , SUM(purchase_amount) AS total_amount

  -- 直近の最大7日間の平均を計算する
  , AVG(SUM(purchase_amount))
    OVER(ORDER BY dt ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
    AS seven_day_avg
FROM purchase_log
;