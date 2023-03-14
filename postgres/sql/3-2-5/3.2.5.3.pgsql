-- 3.2.5.3:age関数を用いて年齢を計算するクエリ
SELECT
  user_id

  -- ■ PostgreSQLの場合、age関数とEXTRACT関数を用いて年単位の年齢を計算できる
  , CURRENT_DATE AS today

FROM mst_users_with_dates
;