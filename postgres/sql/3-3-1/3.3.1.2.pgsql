SELECT
    user_id
  , COUNT(*) AS total_count
  , COUNT(DISTINCT user_id) AS user_count
  , COUNT(DISTINCT product_id) AS product_count
  , SUM(score) AS sum
  , AVG(score) AS avg
  , MAX(score) AS max
  , MIN(score) AS min
FROM
  review

;