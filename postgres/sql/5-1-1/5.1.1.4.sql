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
                OVER(PARTITION BY seesion ORDER BY stamp
                  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
                , '') <> ''
              THEN 'member'
            
          END AS member_status
    FROM
        action_log
)