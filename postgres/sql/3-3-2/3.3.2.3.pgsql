SELECT
    product_id

    -- スコア順に一意なランキングを付与する
    , ROW_NUMBER() OVER(ORDER BY score DESC) AS row

FROM popular_products
WHERE category = 'action'
ORDER BY row
;