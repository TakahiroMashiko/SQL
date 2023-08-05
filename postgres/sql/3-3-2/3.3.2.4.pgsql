SELECT
    category
    , product_id
    , score

    -- カテゴリごとに、スコア順に一意なランキングを付与する
    , ROW_NUMBER()
        OVER(PARTITION BY category ORDER BY score DESC)
    AS row

    -- カテゴリごとに、同順位を許容するランキングを付与する
    , RANK()

FROM popular_products