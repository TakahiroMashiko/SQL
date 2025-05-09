/*
検索ログの前処理
PK: user_id, log_time
*/
with search_log as (
    select
        s_log.user_id
        , case
            when
                lag (s_log.log_time) over (partition by s_log.user_id order by s_log.log_time) is null
        end as session_delta
    from
        activity.search_log s_log
)