--Min/Max/Average 
SELECT MIN(rental_duration) AS min_rental_duration,
              MAX(rental_duration) AS max_rental_duration, 
              AVG(rental_duration) AS avg_rental_duration, 
              MIN(rental_rate) AS min_rental_rate,   
              MAX(rental_rate) AS max_rental_rate, 
              AVG(rental_rate) AS avg_rental_rate, 
              MIN(length) AS min_length, 
              MAX(length) AS max_length,  
             AVG(length) AS avg_length, MIN(replacement_cost) AS min_replacement_cost,         
             MAX(replacement_cost) AS max_replacement_cost, 
             AVG(replacement_cost) AS avg_replacement_cost 

--customer count
SELECT COUNT(customer_id) AS customer_count
FROM customer

--movie genre count
SELECT COUNT(name) AS name_count
FROM category

--movie count
SELECT COUNT(film_id) AS film_count
FROM film

--movie count by language
SELECT COUNT(film_id) AS count_movies, 
            language.language_id, 
           language.name AS language 
FROM film
RIGHT JOIN language ON film.language_id = language.language_id
GROUP BY language.name,language.language_id
ORDER BY count_movies DESC

--select films that contributed the most to the revenue gain
SELECT title, 
      SUM(amount) AS revenue           
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY title
ORDER BY revenue DESC
LIMIT 10

--select films that contributed the least to the revenue gain
SELECT title, 
      SUM(amount) AS revenue           
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY title
ORDER BY revenue ASC
LIMIT 10
