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
        OVER(PARTITION BY category ORDER BY score DESC)
    AS rank

    -- カテゴリごとに、同順位を許容し、同順位の次の順位を飛ばさないランキングを付与する
    , DENSE_RANK()
        OVER(PARTITION BY category ORDER BY score DESC)
    AS dense_rank
FROM popular_products
ORDER BY category, row
;