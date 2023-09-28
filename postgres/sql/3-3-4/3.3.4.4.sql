SELECT
  purchase_id
  -- カンマ区切りの文字列を一度に行に展開する
  , regexp_split_to_table(product_ids, ',') AS product_id
FROM purchase_log;