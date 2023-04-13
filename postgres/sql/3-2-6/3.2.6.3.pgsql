SELECT
  ip
  -- ■ PostgreSQL, Redshiftの場合、split_partで文字列を分解する
  , CAST(split_part(ip, '.', 1) AS integer) AS ip_part_1
  , CAST(split_part(ip, '.', 2) AS integer) AS ip_part_2
FROM
  (SELECT '192.168.0.1' AS ip) AS t
;