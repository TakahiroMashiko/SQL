-- DISTINCT句を付与して重複を排除する
SELECT DISTINCT
    category
    -- カテゴリごとにランキング最上位の商品IDを取得する
    , FIRST_VALUE(product_id)
        OVER(PARTITION BY category ORDER BY score DESC
          ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
      AS product_id
FROM popular_products
;