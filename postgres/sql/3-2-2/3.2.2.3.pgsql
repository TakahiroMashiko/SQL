SELECT
  year
  , (q1 + q2 + q3 + q4) / 4 AS average
FROM
  quarterly_sales
ORDER BY
  year
;