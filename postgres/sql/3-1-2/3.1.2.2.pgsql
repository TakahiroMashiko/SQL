SELECT
  stamp
  , url
  -- URLのパスやGETパラメータのid値を抽出する
  -- ■PostgreSQLの場合、substring関数と正規表現を用いる
  , substring(url from '//[^/]+([^?#]+)') AS path
  , substring(url from 'id=([^&]*)') AS id
  -- ■Redshiftの場合、regexp_substr関数とregexp_replace関数を組み合わせる
  -- , regexp_replace(regexp_substr(url, '//[^/]+[^?#]+'), '//[^/]+', '') AS path
  -- , regexp_replace(regexp_substr(url, 'id=[^&]*'), 'id=', '') AS id
  -- ■BigQueryの場合、正規表現にregexp_extract関数を用いる
  -- , regexp_extract(url, '//[^/]+([^?#]+)') AS path
  -- , regexp_extract(url, 'id=([^&]*)') AS id
  -- ■Hive、SparkSQLの場合、parse_url関数でURLのパス部分やクエリパラメータ部分の値を抽出する
  -- , parse_url(url, 'PATH') AS path
  -- , parse_url(url, 'QUERY') AS id
FROM access_log
;