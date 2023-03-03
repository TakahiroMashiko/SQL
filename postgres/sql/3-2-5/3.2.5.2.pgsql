-- 3.2.5.2:2つの日付の日数差を計算するクエリ
SELECT
  user_id

  -- ■ PostgreSQL、Redshiftの場合、日付型同士の引き算ができる
  , CURRENT_DATE AS today

FROM mst_users_with_dates
;