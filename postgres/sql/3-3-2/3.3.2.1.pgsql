SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  , ROW_NUMBER()        OVER(ORDER BY score DESC) AS row
  -- 同順位を許容するランキングを付与する
  , RANK()              OVER(ORDER BY score DESC) AS rank

FROM popular_products
ORDER BY row
;