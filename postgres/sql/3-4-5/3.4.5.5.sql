WITH
mst_devices AS (
  SELECT
    -- map型のデータを絡むに展開する
    d['device_id'] AS device_id
    , d['device_name'] AS device_name
    FROM
    -- 配列をテーブルに展開する
    (SELECT explode(
      array(
          map('device_id', '1' , 'device_name', 'PC')
      )) d
    ) AS t
)