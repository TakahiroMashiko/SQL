WITH
daily_purchase AS (
  SELECT
    dt
    -- 「年」「月」「日」をそれぞれ抽出する
    -- ■ PostgreSQL, Hive, Redshift, SparkSQLの場合は下記
    -- ■ BigQueryの場合、substringをsubstrに修正
  , substring(dt, 1, 4) AS year
)

;