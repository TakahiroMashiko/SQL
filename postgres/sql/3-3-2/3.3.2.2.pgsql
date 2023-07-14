SELECT
    product_id
  , score

  -- スコア順に一意なランキングを付与する
  , ROW_NUMBER() OVER(ORDER BY score DESC) AS row

  -- ランキング上位からの累計スコア合計を計算する
  , SUM(score)
      OVER(ORDER BY score DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    AS cum_score

  -- 今の行と前後1行ずつの、合計3行の平均スコアを計算する
  , AVG(score)
      OVER(ORDER BY score DESC
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
    AS local_score
FROM popular_products
ORDER BY row
;