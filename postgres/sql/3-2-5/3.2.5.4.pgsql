-- 3.2.5.4:年部分の差分を計算するクエリ
SELECT
  user_id

  -- ■ Redshiftの場合、datediff関数にyearを指定しても、年部分での差分しか計算できない
  , CURRENT_DATE AS today
  , register_stamp::date AS register_date
  , birth_date::date AS birth_date
  , date_diff(year, birth_date::date, CURRENT_DATE)
  , date_diff(year, birth_date::date, register_stamp::date)

  -- ■ BigQueryの場合、date_diff関数にyearを指定しても、年部分での差分しか計算できない
  -- , CURRENT_DATE AS today
  -- , date(timestamp(register_date)) AS register_date

FROM mst_users_with_dates
;