WITH
mst_users_with_int_birth_date AS (
    SELECT
        *
        -- 特定の日付（2017年1月1日）の整数表現
        , 20170101 AS int_specific_date
         -- 文字列の生年月日を、日付の整数表現に変換
        -- PostgreSQL、Redshiftの場合は下記
        , CAST(replace(substring(birth_date, 1, 10), '-', '') AS integer) AS int_birth_date
        -- BigQueryの場合は下記
        -- , CAST(replace(substr(birthdate, 1, 10), '-', '') AS int64) AS int_birth_date
        -- Hive, SparkSQLの場合は下記
        -- , CAST(regexp_replace(substring(birth_date, 1, 10), '-', '') AS int)
        -- AS int_birth_date
    FROM
        mst_users
)
, mst_users_with_age AS (
    SELECT
        *
    FROM
        mst_users_with_int_birth_date
)