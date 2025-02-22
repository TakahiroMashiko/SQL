WITH
stats as (
    -- ログ全体のユニークユーザ数を求める
    SELECT COUNT(DISTINCT seesion) AS total_uu
    FROM action_log
)