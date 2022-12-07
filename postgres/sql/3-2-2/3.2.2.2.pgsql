SELECT
  year,
  -- Q1~Q4の最大売上を取得する
  , greatest(q1, q2, q3, q4) AS greatest_sales
  -- Q1~Q4の最小売上を取得する
  , least(q1, q2, q3, q4) AS least_sales
FROM
  quarterly_sales
;