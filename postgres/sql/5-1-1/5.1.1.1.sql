WITH
stats as (
    -- ログ全体のユニークユーザ数を求める
    SELECT COUNT(DISTINCT seesion) AS total_uu
    FROM action_log
)
SELECT
    l.action
  -- アクションUU
  , COUNT(DISTINCT l.seesion) AS action_uu
  , COUNT(1) AS action_count
FROM
    action_log AS l