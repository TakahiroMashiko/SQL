SELECT
  user_id
  -- PostgreSQLの場合、interval型のデータを用いて日付/時刻の四則演算ができる
  , register_stamp::timestamp AS register_stamp
  , register_stamp::timestamp + '1 hour'::interval AS after_1_hour
  , register_stamp::timestamp - '30minutes'::interval AS before_30_minutes

  , register_stamp::date AS register_date
  , (register_stamp::date + '1 day'::interval)::date AS after_1_day
  , (register_stamp::date - '1 month'::interval)::date AS before_1_month

FROM
  mst_users_with_dates
;