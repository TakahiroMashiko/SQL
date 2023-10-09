SELECT
  purchase_id
  , product_ids
  -- 商品IDの文字列からカンマを取り除き、文字列の差を計算して商品数を取得する
  , 1 + char_length(product_ids)
      - char_length(replace(product_ids, ',', ''))
  AS product_num
FROM
  purchase_log
;