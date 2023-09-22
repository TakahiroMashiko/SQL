SELECT
  purchase_id
  , product_id
FROM
  purchase_log AS p
  -- string_to_array関数で文字列を配列に変換し、unnest関数でテーブルに変換する
  CROSS JOIN unnest(string_to_array(product_ids, ',')) AS product_id