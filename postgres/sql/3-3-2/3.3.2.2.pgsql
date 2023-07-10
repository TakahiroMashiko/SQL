SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  , ROW_NUMBER() OVER(ORDER BY score DESC) AS row

  -- ランキング上位からの累計スコア合計を計算する
  , SUM(score)

FROM popular_products
ORDER BY row
;