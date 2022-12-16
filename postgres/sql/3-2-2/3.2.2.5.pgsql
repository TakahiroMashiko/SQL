SELECT
  year
  , (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0))
  / (SIGN(COALESCE(q1, 0)) + SIGN(COALESCE(q2, 0))
  +  SIGN(COALESCE(q3, 0)) + SIGN(COALESCE(q4, 0)))
  AS average
FROM
  quarterly_sales
ORDER BY
  year
;