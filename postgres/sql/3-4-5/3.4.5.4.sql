WITH
mst_devices AS (
  SELECT
    -- 配列をカラムに展開する
    d[0] AS device_id
    , d[1] AS device_name
  FROM
    -- 配列をテーブルに展開する
    (SELECT explode(
      array(
        array(1 , 'PC')
        , array(2 , 'SP')
        , array(3 , 'アプリ')
      )) d
    ) AS t
)
SELECT *
FROM mst_devices
;