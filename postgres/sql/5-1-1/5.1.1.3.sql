WITH
action_log_with_status as (
    SELECT
        seesion
        , user_id
        , action
    FROM
        action_log
)