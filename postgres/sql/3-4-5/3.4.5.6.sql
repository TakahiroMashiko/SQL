WITH
series AS (
  -- 1から5までの連番を生成する
  -- ■ PostgreSQLの場合、generate_seriesを用いる
  SELECT generate_series(1, 5) AS idx
)