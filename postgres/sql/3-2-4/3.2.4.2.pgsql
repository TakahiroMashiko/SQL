SELECT
  sqrt(power(x1 - x2, 2) + power(y1- y2, 2)) AS dist
  -- ■PostgreSQLの場合はpoint型と距離演算子<->が使用できる
  -- , point(x1, y1) <-> point(x2, y2) AS dist
FROM location_id_2d
;