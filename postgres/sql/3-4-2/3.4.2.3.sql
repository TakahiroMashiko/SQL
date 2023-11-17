SELECT
  m.category_id
  , m.name
  -- 相関サブクエリでカテゴリー別の売上額を取得
  (SELECT s.sales
   FROM category_sales AS s
   WHERE m.category_id = s.category_id)
FROM
  mst_categories AS m