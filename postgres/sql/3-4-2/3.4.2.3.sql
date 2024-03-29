SELECT
  m.category_id
  , m.name
  -- 相関サブクエリでカテゴリー別の売上額を取得
  , (SELECT s.sales
   FROM category_sales AS s
   WHERE m.category_id = s.category_id
   ) AS sales
   -- 相関サブクエリでカテゴリー別のトップ売上商品を1件取得（ランクによる絞込が不要）
   , (SELECT r.product_id
   FROM category_sale_ranking AS r
   WHERE m.category_id = r.category_id
   ORDER BY sales DESC
   LIMIT 1
   ) AS top_sale_product
FROM
  mst_categories AS m