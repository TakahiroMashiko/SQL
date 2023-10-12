SELECT
  l.purchase_id
  , l.product_ids
  -- 商品の数だけ連番を付与する
  , p.idx
FROM
  purchase_log AS l
;