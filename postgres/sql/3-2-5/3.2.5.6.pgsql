-- 3.2.5.6:文字列型の誕生日から、登録時点と現在時点での年齢を計算するクエリ
SELECT
  user_id
  , substring(register_stamp, 1, 10) AS register_date
  , birth_date
  -- 登録時点での年齢を計算
  , floor(
    ( CAST(replace(substring(register_stamp, 1, 10), '-', '') AS integer)
    - CAST(replace(birth_date, '-', '') AS integer)
    ) / 10000
  ) AS register_age
  -- 現在時点での年齢を計算
  , floor(
    ( CAST(replace(CAST(CURRENT_DATE AS text), '-', '') AS integer)
    - CAST(replace(birth_date, '-', '') AS integer)
    ) / 10000
  ) AS current_age

  -- ■ BigQueryの場合、textをstring、integerをint64に置き換える
  -- ( CAST(replace(CAST(CURRENT_DATE AS string), '-', '') AS int64)
  -- - CAST(replace(birth_date, '-', '') AS int64)
  -- ) / 10000

FROM mst_users_with_dates
;