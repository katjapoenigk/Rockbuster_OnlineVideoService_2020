--indentify the top 10 cities within the top 10 countries
SELECT D.country, 
       C.city,
COUNT (customer_id) AS count_of_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country,
         C.city
HAVING country IN ('India', 'China', 'United States', 'Japan', 'Mexico','Brazil',
                   'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')
ORDER BY count_of_customers DESC
LIMIT 10
