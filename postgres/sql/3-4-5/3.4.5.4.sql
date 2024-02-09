WITH
mst_devices AS (
  SELECT
    -- 配列をカラムに展開する
    d[0] AS device_id
    , d[1] AS device_name
  FROM
    -- 配列をテーブルに展開する
    (SELECT explode(

    )
    ) AS t
)

;