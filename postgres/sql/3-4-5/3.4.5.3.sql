WITH
mst_devices(device_id, device_name) AS (
  VALUES
    (1, 'PC')
  , (2, 'SP')
  , (3, 'アプリ')
)
SELECT *
FROM mst_devices
;