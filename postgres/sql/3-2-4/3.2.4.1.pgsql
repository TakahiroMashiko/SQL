SELECT
  abs(x1 - x2) AS abs
  , sqrt(power(x1 - x2, 2)) AS rms
FROM location_1d
;