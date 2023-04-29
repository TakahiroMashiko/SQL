SELECT
  ip
  -- ■ PostgreSQL、Redshiftの場合、Split_partで文字列を分割する
  , CAST(split_part(ip, '.', 1) AS integer) * 2^24
  + CAST(split_part(ip, '.', 2) AS integer) * 2^16
  + CAST(split_part(ip, '.', 3) AS integer) * 2^8
  + CAST(split_part(ip, '.', 4) AS integer) * 2^0
  AS ip_integer

FROM
  (SELECT '192.168.0.1') AS text
;