SELECT
  l.purchase_id
  , l.product_ids
  -- 商品の数だけ連番を付与する
  , p.idx
  -- 文字列をカンマ区切りで分割し、idx番号の要素を取り出す
  , split_part(l.product_ids, ',', p.idx) AS product_id
FROM
  purchase_log AS l
JOIN
  (
    SELECT 1 AS idx
    UNION ALL SELECT 2 AS idx
  ) AS p
;