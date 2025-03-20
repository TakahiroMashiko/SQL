WITH
action_log_with_status as (
    SELECT
        seesion
        , user_id
    FROM
        action_log
)