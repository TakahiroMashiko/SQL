SELECT
    user_id
  , product_id
    -- 個別のレビュースコア
  , score
    -- 全体のレビュースコア
  , AVG(score) OVER() AS avg_score
    -- ユーザの平均レビュースコア
  , AVG(score) OVER(PARTITION BY user_id) AS user_avg_score

FROM
  review
;