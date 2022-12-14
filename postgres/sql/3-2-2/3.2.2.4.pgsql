SELECT
  year
  , (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0)) / 4
  AS average
FROM
  quarterly_sales
ORDER BY
  year
;