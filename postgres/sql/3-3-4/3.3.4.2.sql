-- ■ PostgreSQLの場合、unnest関数を用いる
SELECT unnest(ARRAY['A001','A002,'A003]) AS product_id;