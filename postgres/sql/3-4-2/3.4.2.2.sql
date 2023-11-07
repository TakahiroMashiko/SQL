SELECT
  m.category_id
  , m.name
  , s.sales
  , r.product_id AS top_sale_product
FROM
  mst_categories AS m
-- 右外部結合を用いて結合できなかったレコードを残す
LEFT JOIN
  -- カテゴリー別の売上額を結合する
  category_sales AS s