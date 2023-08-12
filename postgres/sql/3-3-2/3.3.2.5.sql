SELECT *
FROM
  -- サブクエリ内でランキングを計算
  ( SELECT
      category
    , product

  ) AS popular_products_with_rank

;