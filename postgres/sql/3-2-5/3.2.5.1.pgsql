SELECT
  user_id
  -- PostgreSQLの場合、interval型のデータを用いて日付/時刻の四則演算ができる
  , register_stamp::timestamp AS register_stamp

FROM
  mst_users_with_dates
;