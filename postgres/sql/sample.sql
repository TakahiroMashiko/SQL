/*
検索ログの前処理
PK: user_id, log_time
*/
with search_log as (
    select
        s_log.user_id
    from
        activity.search_log s_log
)