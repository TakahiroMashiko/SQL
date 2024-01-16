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
  , r3.sales AS book_sales
FROM mst_rank AS m
LEFT JOIN
  product_sale_ranking AS r1
  ON m.rank = r1.rank
  AND r1.category_name = 'dvd'
LEFT JOIN
  product_sale_ranking AS r2
  ON m.rank = r2.rank
  AND r2.category_name = 'cd'
LEFT JOIN
  product_sale_ranking AS r3
  ON m.rank = r3.rank
  AND r3.category_name = 'book'
ORDER BY m.rank
;