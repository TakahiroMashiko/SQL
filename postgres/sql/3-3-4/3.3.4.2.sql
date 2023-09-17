-- ■ PostgreSQLの場合、unnest関数を用いる
SELECT unnest(ARRAY['A001','A002,'A003]) AS product_id;

-- ■ BigQueryの場合もunnest関数を用いるが、テーブル関数はFROM句内でしか使えない
SELECT * FROM unnest(ARRAY['A001','A002,'A003]) AS product_id;