WITH
mst_devices AS (
  SELECT
    -- map型のデータを絡むに展開する
    d['device_id'] AS device_id
)