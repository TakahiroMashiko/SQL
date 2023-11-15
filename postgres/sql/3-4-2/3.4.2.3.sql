SELECT
  m.category_id
  , m.name
  -- 相関サブクエリでカテゴリー別の売上額を取得
  (SELECT s.sales)
FROM
  mst_categories AS m