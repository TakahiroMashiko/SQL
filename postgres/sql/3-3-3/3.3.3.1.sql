SELECT
    purchase_id

    -- 商品IDを配列に集約し、カンマ区切りの文字列に変換
    -- ■ PostgreSQL, BigQueryの場合はstring_aggを用いる
  , string_agg(product_id, ',') AS product_ids

    -- ■ Redshiftの場合はlistaggを用いる
    -- , listagg(product_id, ',') AS product_ids

    -- Hive, SparkSQLの場合はcollet_listとconcat_wsを用いる
    -- , concat_ws(',', collet_list(product_id)) AS product_ids
FROM daily_kpi
;