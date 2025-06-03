/*
検索ログの前処理
PK: user_id, log_time
*/.
with search_log as (
    select
        s_log.user_id
        , case
            when
                lag (s_log.log_time) over (partition by s_log.user_id order by s_log.log_time) is null
                    or s_log.log_time > lag(s_log.log_time) over (partition by s_log.user_id order by s_log.log_time) + interval '00:30' 
                then 1
            else 0
        end as session_delta
        , s_log.log_time
        , trim(m.word1
            ||' '|| coalesce(m.word2,'')
            ||' '|| coalesce(m.word3,'')
            ||' '|| coalesce(m.word4,'')
            ||' '|| coalesce(m.word5,'')
        ) as keywords
    from
        activity.search_log s_log
    inner join source.factor_score_flg f
        on s_log.user_id = f.user_id
        and s_log.keywords = f.keywords
    inner join source. factor_score_mst m on s_log.attr_id = m.attr_id
    where
        s_log.log_time >= '2015-02-01 00:00:00'
        and s_log.log_time < '2015-02-01 01:00:00'
)
/*
ユーザの検索分析
PK: user_id, user_session_id
*/
select

from (
    select
        user_id

    from (
        select    
            user_id
        from
            search_log
    )
)