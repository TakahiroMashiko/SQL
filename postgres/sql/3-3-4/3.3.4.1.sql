SELECT
    q.year
    -- Q1からQ4までのラベル名を表示
  , CASE
      WHEN p.idx = 1 THEN 'q1'
      WHEN p.idx = 2 THEN 'q2'

    END AS quarter
FROM
    quarterly_sales AS q