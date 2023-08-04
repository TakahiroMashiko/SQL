SELECT
    category
    , product_id
    , score

    -- カテゴリごとに、スコア順に一意なランキングを付与する
    , ROW_NUMBER()
        OVER(PARTITION BY category ORDER BY score DESC)
    AS row

FROM popular_products