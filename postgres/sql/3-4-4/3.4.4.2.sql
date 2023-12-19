WITH
product_sale_ranking AS (
  SELECT
    category_name
    , product_id
    , sales
    , ROW_NUMBER() OVER(PARTITION BY category_name ORDER BY sales DESC) AS rank
  FROM
    product_sales
)
, mst_rank as (
  SELECT DISTINCT rank
  FROM product_sale_ranking
)
SELECT *