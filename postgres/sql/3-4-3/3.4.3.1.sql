SELECT
  m.user_id
  , m.card_number
  , COUNT(p.user_id) AS purchase_count
  -- クレジットカード番号を登録している場合は1、登録していない場合は0で表現する
  , CASE WHEN m.card_number IS NOT NULL THEN 1 ELSE 0 END AS has_card
  -- 購入履歴がある場合は1、ない場合は0で表現する
  , SIGN(COUNT(p.user_id)) AS has_purchased
FROM
  mst_users_with_card_number AS m
  LEFT JOIN
    purchase_log AS p
    ON m.user_id = p.user_id
GROUP BY m.user_id, m.card_number
;