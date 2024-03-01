SELECT
  ROW_NUMBER() OVER(ORDER BY x) AS idx
FROM
  -- repeat関数とsplit関数を組み合わせて任意長の配列を生成し、explodeで行に展開する
  (SELECT explode(split(repeat('x', 5 - 1), 'x')) AS x) AS t
;