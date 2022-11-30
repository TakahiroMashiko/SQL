SELECT
  year
  , q1
  , q2
  -- Q1とQ2の売上変化を評価する
  , CASE
      WHEN q1 < q2 THEN '+'
      WHEN q1 = q2 THEN ' '
      ELSE '-'
  END AS judge_q1_q2
  -- Q1とQ2の売上額の差を計算する
  , q2 - q1 AS diff_q2_q1
  -- Q1とQ2の売上変化を1、0、-1で表現する
  , SIGN(q2 - q1) AS sign_q2_q1
FROM
  quarterly_sales
ORDER BY
  year
;