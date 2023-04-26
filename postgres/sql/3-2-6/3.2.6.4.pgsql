SELECT
  ip
  -- ■ PostgreSQL、Redshiftの場合、Split_partで文字列を分割する
  , CAST(split_part(ip, '.', 1) AS integer) * 2^24

FROM
  (SELECT '192.168.0.1') AS text
;