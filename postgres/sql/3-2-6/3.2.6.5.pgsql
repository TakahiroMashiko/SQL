SELECT
  ip
  -- ■ PostgreSQL, Redshiftの場合、split_partで文字列を分解する
  , CAST(split_part(ip, '.', 1) AS integer) * 2^24

FROM
  (SELECT '192.168.0.1') AS t