-- 3.2.5.2:2つの日付の日数差を計算するクエリ
SELECT
  user_id

  -- ■ PostgreSQL、Redshiftの場合、日付型同士の引き算ができる
  , CURRENT_DATE AS today
  , register_stamp::date AS register_date
  , CURRENT_DATE - register_date AS diff_days

  -- ■ BigQueryの場合、date_diff関数が利用できる
  -- , CURRENT_DATE AS today
  -- , date(timestamp(register_date)) AS register_date
  -- , date_diff(CURRENT_DATE, date(timestamp(register_stamp)), day) AS diff_days

FROM mst_users_with_dates
;