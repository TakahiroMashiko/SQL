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