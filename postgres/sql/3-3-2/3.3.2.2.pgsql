SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  ROW_NUMBER() OVER(ORDER BY score DESC) AS row

FROM popular_products
ORDER BY row
;