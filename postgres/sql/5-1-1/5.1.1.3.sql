WITH
action_log_with_status as (
    SELECT
        seesion
        , user_id
        , action
        -- user_idがnullまたは空文字でない場合はloginと判定
        , CASE WHEN COALESCE(user_id, '') <> '' THEN 'login' ELSE 'guest' END
          AS login_status
    FROM
        action_log
)
SELECT
      COALESCE(action, 'all') AS action
    , COALESCE(login_status, 'all') AS login_status
    , COALESCE(DISTINCT session, 'all') AS action_uu
    , COUNT(1) AS action_count
FROM
    action_log_with_status
GROUP BY
    -- ▪ PostgreSQL, SparkSQLの場合は下記
      ROLLUP(action, login_status)
    -- ▪ Hiveの場合は下記
    -- action, login_status WITH ROLLUP
;