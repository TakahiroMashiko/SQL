SELECT
  m.category_id
  , m.name
  , s.sales
  , r.product_id AS sale_product
FROM
  mst_categories AS m