SELECT *
FROM
  -- サブクエリ内でランキングを計算
  ( SELECT
      category
    , product
    , store

  ) AS popular_products_with_rank

;