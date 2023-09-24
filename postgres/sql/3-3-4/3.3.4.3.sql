SELECT
  purchase_id
  , product_id
FROM
  purchase_log AS p
  -- string_to_array関数で文字列を配列に変換し、unnest関数でテーブルに変換する
  CROSS JOIN unnest(string_to_array(product_ids, ',')) AS product_id

  -- ■ BigQueryの場合は、文字列分解にsplit関数を用いる
  -- CROSS JOIN unnest(split(product_ids, ',')) AS product_id

  -- ■ HiveやSparkSQLの場合は、LATERAL VIEW explodeを用いる
  -- LATERAL VIEW explode(split(product_ids, ',')) e AS product_id;