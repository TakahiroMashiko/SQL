SELECT
    COUNT(*) AS total_count
  , COUNT(DISTINCT user_id) AS user_count
  , COUNT(DISTINCT product_id) AS product_count

FROM
  review
;