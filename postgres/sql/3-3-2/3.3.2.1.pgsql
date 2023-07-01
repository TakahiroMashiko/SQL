SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  , ROW_NUMBER()        OVER(ORDER BY score DESC) AS row
  -- 同順位を許容するランキングを付与する
  , RANK()              OVER(ORDER BY score DESC) AS rank
  -- 同順位を許容し、同順位の次の順位を飛ばさないランキングを付与する
  , DANSE_NUMBER()      OVER(ORDER BY score DESC) AS danse_rank

FROM popular_products
ORDER BY row
;