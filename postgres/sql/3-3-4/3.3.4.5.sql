SELECT *
FROM (
  SELECT 1 AS idx
  UNION ALL SELECT 2 AS idx

) AS pivot
;