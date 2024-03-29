WITH
mst_devices as (
  SELECT 1 AS device_id, 'PC' AS device_name
  UNION ALL SELECT 2 AS device_id, 'SP' AS device_name
  UNION ALL SELECT 3 AS device_id, 'アプリ' AS device_name
)
SELECT
  u.user_id
  , d.device_name
FROM
  users AS u
LEFT JOIN
  mst_devices AS d
  ON u.regist_device = d.device_id
;