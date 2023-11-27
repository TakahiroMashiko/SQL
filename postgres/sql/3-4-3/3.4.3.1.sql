SELECT
  m.user_id
  , m.card_number
  , COUNT(p.user_id) AS purchase_count
FROM
  mst_users_with_card_number AS m