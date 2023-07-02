SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  , ROW_NUMBER()        OVER(ORDER BY score DESC) AS row
  -- 同順位を許容するランキングを付与する
  , RANK()              OVER(ORDER BY score DESC) AS rank
  -- 同順位を許容し、同順位の次の順位を飛ばさないランキングを付与する
  , DANSE_NUMBER()      OVER(ORDER BY score DESC) AS danse_rank

  -- 現在の行より前の行の値を取得する
  , LAG(product_id)     OVER(ORDER BY score DESC) AS lag1

FROM popular_products
ORDER BY row
;