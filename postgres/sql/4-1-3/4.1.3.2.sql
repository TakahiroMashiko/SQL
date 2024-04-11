WITH
daily_purchase AS (
  SELECT
    dt
    -- 「年」「月」「日」をそれぞれ抽出する
    -- ■ PostgreSQL, Hive, Redshift, SparkSQLの場合は下記
    -- ■ BigQueryの場合、substringをsubstrに修正
  , substring(dt, 1, 4) AS year
  , substring(dt, 6, 2) AS month
  , substring(dt, 9, 2) AS date
  , SUM(purchase_amount) AS purchase_amount
  FROM purchase_log
  GROUP BY dt
)
SELECT
  *
FROM
  daily_purchase

;