-- 3.2.5.6:文字列型の誕生日から、登録時点と現在時点での年齢を計算するクエリ
SELECT
  user_id
  , substring(register_stamp, 1, 10) AS register_date

FROM mst_users_with_dates
;