--revenue by country 
SELECT SUM (A.amount), F.country
FROM payment A
INNER JOIN rental B ON A.rental_id = B.rental_id
INNER JOIN customer C ON B.customer_id = C.customer_id
INNER JOIN address D ON C.address_id = D.address_id
INNER JOIN city E ON D.city_id = E.city_id
INNER JOIN country F ON E.country_id = F.country_id
GROUP BY F.country
ORDER BY sum DESC
