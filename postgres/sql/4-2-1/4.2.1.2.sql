SELECT
    COALESCE(category, 'all')     AS category
  
FROM
  purchase_detail_log