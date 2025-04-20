WITH action_log_with_status AS (
    SELECT
          seesion
        , user_id
        , action
    FROM
        action_log
)