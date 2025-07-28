WITH
mst_users_with_int_birth_date AS (
    SELECT
        *
        -- 特定の日付（2017年1月1日）の整数表現
        , 20170101 AS int_specific_date
    FROM
        mst_users
)