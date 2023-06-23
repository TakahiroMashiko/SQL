SELECT
    user_id
  , product_id
    -- 個別のレビュースコア
  , score
    -- 全体のレビュースコア
  , AVG(score) OVER() AS avg_score

FROM
  review
;