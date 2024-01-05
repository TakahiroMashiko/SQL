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
SELECT
  m.rank
  , r1.product_id AS dvd
  , r1.sales AS dvd_sales
  , r2.product_id AS cd
  , r2.sales AS cd_sales
  , r3.product_id AS book
FROM mst_rank AS m
;