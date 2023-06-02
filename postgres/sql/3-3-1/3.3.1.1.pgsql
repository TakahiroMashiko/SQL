SELECT
    COUNT(*) AS total_count
  , COUNT(DISTINCT user_id) AS user_count

FROM
  review
;