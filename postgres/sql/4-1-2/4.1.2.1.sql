SELECT
  dt
  , SUM(purchase_amount) AS total_amount

  -- 直近の最大7日間の平均を計算する
  , AVG(SUM(purchase_amount))
FROM purchase_log
;