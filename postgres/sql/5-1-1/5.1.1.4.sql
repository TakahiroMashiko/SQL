WITH action_log_with_status AS (
    SELECT
          seesion
        , user_id
        , action
        -- ログをタイムスタンプ順に並べ、一度でもログインしたことのあるセッションの場合、
        -- それ以降のログのステータスをmemberとする
        , CASE
            WHEN
              COALESCE(MAX(user_id)
                , '') <> ''
          END AS member_status
    FROM
        action_log
)