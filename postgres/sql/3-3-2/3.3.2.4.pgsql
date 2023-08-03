SELECT
    category
    , product_id
    , score

    -- カテゴリごとに、スコア順に一意なランキングを付与する
    , ROW_NUMBER()

FROM popular_products