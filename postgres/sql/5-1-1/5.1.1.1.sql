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
  -- アクション数
  , COUNT(1) AS action_count
  -- 全体UU
  , s.total_uu
  -- 利用率: アクションUU / 全体UU
  , 100.0 * COUNT(DISTINCT l.seesion) / s.total_uu AS usage_rate
FROM
    action_log AS l