SELECT
  year
  , q1
  , q2
  -- q1とq2の売上変化を評価する
  , CASE
      WHEN q1 < q2 THEN '+'
      WHEN q1 = q2 THEN ' '
      ELSE '-'
  END AS judge_q1_q2
FROM
  quarterly_sales
;