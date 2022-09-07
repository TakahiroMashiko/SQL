SELECT
  stamp
  -- referrerのホスト名部分を抽出する
  -- ■PostgreSQLの場合、substring関数と正規表現を用いる
  , substring(referrer from 'https?://([^/]*)') AS referrer_host
  -- ■Redshiftの場合、正規表現にバーレンが使用できないため、
  -- regexp_substr関数とregexp_replace関数を組み合わせる
  -- ,regexp_replace(regexp_substr(referrer, 'http?://[^/]*'), 'https?://', '')
  -- AS referrer_host
  -- ■Hive,SparkSQLの場合、parase_url関数でホスト名を抽出できる
  -- ,parse_url(referrer, 'HOST') AS referrer_host

FROM access_log
;