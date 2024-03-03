# 1677. Product's Worth Over Invoices

SELECT p.name AS name, SUM(IFNULL(i.rest,0)) AS rest, SUM(IFNULL(i.paid,0)) AS paid, SUM(IFNULL(i.canceled, 0)) AS canceled, SUM(IFNULL(i.refunded,0)) AS refunded
FROM product p LEFT JOIN invoice i
ON p.product_id = i.product_id
GROUP BY p.name
ORDER BY p.name
