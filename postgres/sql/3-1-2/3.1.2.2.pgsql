SELECT
  stamp
  , url
  -- URLのパスやGETパラメータのid値を抽出する
  -- ■PostgreSQLの場合、substring関数と正規表現を用いる
  , substring(url from '//[^/]+([^?#]+)') AS path
FROM access_log
;