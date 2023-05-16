SELECT
  ip
  -- ■ PostgreSQL, Redshiftの場合、lpad関数で0埋めする
  ,   lpad(split_part(ip, '.', 1), 3, '0')
  ||  lpad(split_part(ip, '.', 2), 3, '0')
  ||  lpad(split_part(ip, '.', 3), 3, '0')

FROM
  (SELECT '192.168.0.1') AS t