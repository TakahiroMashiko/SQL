-- 3.2.5.1:未来や過去の日付・時刻を計算するクエリ
SELECT
  user_id
  -- ■ PostgreSQLの場合、interval型のデータを用いて日付/時刻の四則演算ができる
  , register_stamp::timestamp AS register_stamp
  , register_stamp::timestamp + '1 hour'::interval AS after_1_hour
  , register_stamp::timestamp - '30minutes'::interval AS before_30_minutes

  , register_stamp::date AS register_date
  , (register_stamp::date + '1 day'::interval)::date AS after_1_day
  , (register_stamp::date - '1 month'::interval)::date AS before_1_month

  -- ■ Redshiftの場合、dateadd関数を用いる
  -- , register_stamp::timestamp AS register_stamp
  -- , dateadd(hour, 1, register_stamp::timestamp) AS after_1_hour
  -- , dateadd(minute, -30, register_stamp::timestamp) AS before_30_minutes
  --
  --
  -- , register_stamp::date AS register_date
  -- , dateadd(day, 1, register_date) AS after_1_day
  -- , dateadd(month, -1, register_stamp) AS before_1_month

  -- ■ BigQueryの場合、timestamp_add/sub, date_add/sub等の関数を用いる
  -- , timestamp(register_stamp) AS register_stamp
  -- , timestamp_add(timestamp(register_stamp), interval 1 hour) AS after_1_hour
  -- , timestamp_sub(timestamp(register_stamp), interval 30 minute) AS before_30_minute
  --
  -- タイムスタンプの文字列から直接日付型に変換できないため、タイムスタンプ型に直してから日付型に変換する
  -- , date(timestamp(register_stamp)) AS register_stamp
  -- , date_add(date(timestamp(register_stamp)), interval 1 day) AS after_1_day
  -- , date_sub(date(timestamp(register_stamp)), interval 1 month) AS before_1_month

  -- ■ Hive, SparkSQLの場合、時刻を計算する関数が実装されていないため、
  -- 一度unixtimeに変換して秒単位の計算を行い、もう一度タイムスタンプに戻す
  -- , CAST(register_stamp AS timestamp) AS register_stamp

FROM
  mst_users_with_dates
;