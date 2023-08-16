SELECT *
FROM
  -- サブクエリ内でランキングを計算
  ( SELECT
      category
    , product
    , store
    -- カテゴリごとに、スコア順に一意なランキングを付与する
    , ROW_NUMBER()
        OVER(PARTITION BY category ORDER BY score DESC)
      AS rank
    FROM popular_products
  ) AS popular_products_with_rank
-- 外側のクエリでランクを絞り込む
WHERE rank <= 2

;