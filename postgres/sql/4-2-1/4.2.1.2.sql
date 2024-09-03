SELECT
    COALESCE(category, 'all')     AS category
  , COALESCE(sub_category, 'all') AS sub_category
FROM
  purchase_detail_log