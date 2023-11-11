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
  ON m.category_id = s.category_id
-- 右外部結合を用いて結合できなかったレコードを残す
LEFT JOIN
  -- カテゴリー別のトップ売上商品を1件取得し結合する
  product_sale_ranking AS r
  ON m.category_id = r.category_id
  AND r.rank = 1