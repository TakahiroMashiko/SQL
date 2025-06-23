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
        , user_session_id
        , min(log_time) as session_start_time
        , max(log_time) as session_end_time
        , count(*) as num_steps
        , max(case session_step when 1 then keywords else null end) as step1
        , max(case session_step when 2 then keywords else null end) as step2
        , max(case session_step when 3 then keywords else null end) as step3
        
    from (
        select
            user_id
            , sum(session_delta) over (
                partition by user_id
                order by log_time
                rows between unbounded preceding and current row
            ) as user_session_id
            , log_time
            , keywords
        from
            search_log
    )
)