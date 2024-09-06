SELECT
    COALESCE(category, 'all')     AS category
  , COALESCE(sub_category, 'all') AS sub_category
  , SUM(price) AS amount
FROM
  purchase_detail_log
GROUP BY
  ROLLUP(category, sub_category)
  -- Hiveの場合は下記を使用
  -- category, sub_category WITH ROLLUP