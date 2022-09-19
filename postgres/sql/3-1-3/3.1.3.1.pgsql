SELECT
  stamp,
  url
  -- パスをスラッシュで配列に分解し、階層ごとに抽出する
  -- パスが必ずスラッシュから始まるので、2番目の要素が最初の階層となる
  -- ■ PostgresSQLの場合、split_partでn番目の要素を抽出できる
  , split_part(substiring(url from '//[^/]+([^?#]+)'), '/', 2) AS path1
  , split_part(substiring(url from '//[^/]+([^?#]+)'), '/', 3) AS path2
FROM access_log