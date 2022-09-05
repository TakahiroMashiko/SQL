SELECT
  stamp
  -- referrerのホスト名部分を抽出する
  -- ■PostgreSQLの場合、substring関数と正規表現を用いる
  , substring(referrer from 'https?://([^/]*)') AS referrer_host
FROM access_log
;