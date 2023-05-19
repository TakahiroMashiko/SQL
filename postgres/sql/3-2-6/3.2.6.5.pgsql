SELECT
  ip
  -- ■ PostgreSQL, Redshiftの場合、lpad関数で0埋めする
  ,   lpad(split_part(ip, '.', 1), 3, '0')
  ||  lpad(split_part(ip, '.', 2), 3, '0')
  ||  lpad(split_part(ip, '.', 3), 3, '0')
  ||  lpad(split_part(ip, '.', 4), 3, '0')
  AS ip_padding

  -- ■ BigQueryの場合、split関数で配列に分解し、n番目の要素を取り出す
  -- , CONCAT(
  --    lpad(split(ip, '.')[SAFE_ORDINAL(1), 3, '0'])

  -- ) AS ip_padding

FROM
  (SELECT '192.168.0.1') AS t