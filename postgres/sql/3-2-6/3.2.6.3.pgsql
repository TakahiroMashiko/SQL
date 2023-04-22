SELECT
  ip
  -- ■ PostgreSQL, Redshiftの場合、split_partで文字列を分解する
  , CAST(split_part(ip, '.', 1) AS integer) AS ip_part_1
  , CAST(split_part(ip, '.', 2) AS integer) AS ip_part_2
  , CAST(split_part(ip, '.', 3) AS integer) AS ip_part_3
  , CAST(split_part(ip, '.', 4) AS integer) AS ip_part_4

  -- ■ BigQueryの場合、split関数で配列に分解し、n番目の要素を取り出す
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(1)] AS int 64) AS ip_part_1
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(2)] AS int 64) AS ip_part_2
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(3)] AS int 64) AS ip_part_3
  -- , CAST(split(ip, '.')[SAFE_ORDINAL(4)] AS int 64) AS ip_part_4

  -- ■ Hive, SparkSQLの場合、split関数で配列に分解し、n番目の要素を取り出す
  -- ただし、ピリオドが特殊文字のため、バックスラッシュでエスケープを行う
  -- , CAST(split(ip, '\\.')[0] AS int) AS ip_part_1
  -- , CAST(split(ip, '\\.')[1] AS int) AS ip_part_2
  -- , CAST(split(ip, '\\.')[2] AS int) AS ip_part_3
  -- , CAST(split(ip, '\\.')[3] AS int) AS ip_part_4
FROM
  (SELECT '192.168.0.1' AS ip) AS t
;