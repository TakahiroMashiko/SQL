SELECT *
FROM
  -- サブクエリ内でランキングを計算
  ( SELECT
      category
    , product
    , store
    -- カテゴリごとに、スコア順に一意なランキングを付与する
    , ROW_NUMBER()

  ) AS popular_products_with_rank

;