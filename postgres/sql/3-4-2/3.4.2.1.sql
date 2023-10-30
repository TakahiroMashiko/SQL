SELECT
  m.category_id
  , m.name
  , s.sales
  , r.product_id AS sale_product
FROM
  mst_categories AS m
JOIN
  -- カテゴリー別の売上額を結合する
  category_sales AS s
  ON m.category_id = s.category_id