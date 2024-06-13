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
, monthly_amount AS (
-- 月別の売上を集計
SELECT
  year
  , month
  , SUM(purchase_amount) AS amount
FROM daily_purchase
GROUP BY year, month
)

, calc_index AS (
SELECT
  year
  , month
  , amount
  -- 2015年の累計売上を計算
  , SUM(CASE WHEN year = '2015' THEN amount END)
    OVER(ORDER BY year, month ROWS UNBOUNDED PRECEDING)
  AS agg_amount
  -- 当月から11ヶ月前までの合計売上（移動年計）を計算
  , SUM(amount)
    OVER(ORDER BY year, month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW)
  AS year_avg_amount
FROM
  monthly_purchase
ORDER BY
  year, month
)
-- 最後に、2015年のデータのみに絞り込む
SELECT
  concat(year, '-', month) AS year_month
  -- ■ Redshiftの場合はconcat関数を組み合わせるか、||演算子を用いる
  -- concat(concat(year, '-'), month) AS year_month
  -- year || '-' || month AS year_month
FROM
  calc_index
WHERE
  year = '2015'
ORDER BY
  year_month