SELECT
    q.year
    -- Q1からQ4までのラベル名を表示
  , CASE
      WHEN p.idx = 1 THEN 'q1'
      WHEN p.idx = 2 THEN 'q2'
      WHEN p.idx = 3 THEN 'q3'
      WHEN p.idx = 4 THEN 'q4'
   END AS quarter
   -- Q1からQ4までのラベル名を表示
  , CASE
      WHEN p.idx = 1 THEN q.q1
      WHEN p.idx = 2 THEN q.q2
      WHEN p.idx = 3 THEN q.q3
      WHEN p.idx = 4 THEN q.q4
    END AS sales
FROM
    quarterly_sales AS q