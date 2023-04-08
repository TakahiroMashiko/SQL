SELECT
  CAST('127.0.0.1' AS inet) < CAST('127.0.0.2' AS inet) AS lt
  , CAST('127.0.0.1' AS inet) > CAST('192.168.0.1' AS inet) AS gt
;