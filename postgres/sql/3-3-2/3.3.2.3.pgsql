SELECT
    product_id

    -- スコア順に一意なランキングを付与する
    , ROW_NUMBER() OVER(ORDER BY score DESC) AS row

    -- ランキングの最初から最後までの範囲を対象に商品IDを集約
    -- ■ PostgreSQLの場合はarray_agg, Hive, SparkSQLの場合はcollect_listを使用する
    , array_agg(product_id)
    -- , collect_list(product_id)
        OVER(ORDER BY score DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
    AS whole_agg

    -- ランキングの最初から現在の行までの範囲を対象に商品IDを集約
    -- ■ PostgreSQLの場合はarray_agg, Hive, SparkSQLの場合はcollect_listを使用する
    , array_agg(product_id)
    -- , collect_list(product_id)
        OVER(ORDER BY score DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND current row)
    AS cum_agg

    -- ランキングの一つ前から一つ後までの範囲を対象に商品IDを集約
    -- ■ PostgreSQLの場合はarray_agg, Hive, SparkSQLの場合はcollect_listを使用する
    , array_agg(product_id)
    -- , collect_list(product_id)

FROM popular_products
WHERE category = 'action'
ORDER BY row
;