SELECT
  ip
  -- ■ PostgreSQL、Redshiftの場合、Split_partで文字列を分割する
  , CAST(split_part(ip, '.', 1) AS integer) * 2^24
  + CAST(split_part(ip, '.', 2) AS integer) * 2^16
  + CAST(split_part(ip, '.', 3) AS integer) * 2^8
  + CAST(split_part(ip, '.', 4) AS integer) * 2^0
  AS ip_integer

  -- ■ BigQueryの場合、split関数で配列に分解し、n番目の要素を取り出す
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(1)] AS int64) * pow(2, 24)
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(2)] AS int64) * pow(2, 16)
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(3)] AS int64) * pow(2, 8)

FROM
  (SELECT '192.168.0.1') AS text
;