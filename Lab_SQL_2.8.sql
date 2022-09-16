-- 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country
FROM sakila.store s
JOIN sakila.address a
ON s.address_id = a.address_id
JOIN sakila.city c
ON a.city_id = c.city_id
JOIN sakila.country co
ON c.country_id = co.country_id;



-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id, SUM(amount) AS 'total_amount'
FROM sakila.store s
JOIN sakila.staff st
ON s.store_id = st.store_id
JOIN sakila.payment p
ON st.staff_id = p.staff_id
GROUP BY s.store_id;


-- 3. Which film categories are longest?
SELECT c.name, length
FROM sakila.film f
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.category c USING (category_id)
GROUP BY c.name
ORDER BY length DESC;




-- 4. Display the most frequently rented movies in descending order.
SELECT title, rental_rate FROM sakila.film
ORDER BY rental_rate DESC;




-- 5. List the top five genres in gross revenue in descending order.
SELECT c.name, SUM(amount) AS 'gross_revenue'
FROM sakila.payment p
JOIN sakila.rental r USING (rental_id)
JOIN sakila.inventory i USING (inventory_id)
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.category c USING (category_id)
GROUP BY c.name
ORDER BY SUM(amount) DESC
LIMIT 5;





-- 6. Is "Academy Dinosaur" available for rent from Store 1? YES
SELECT store_id, title 
FROM sakila.inventory i
JOIN sakila.film f USING (film_id)
WHERE title = 'Academy Dinosaur';



-- 7. Get all pairs of actors that worked together.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film;

SELECT f1.film_id , f1.actor_id AS 'Actor_1', f2.actor_id AS 'Actor_2'
FROM sakila.film_actor f1
JOIN sakila.film_actor f2
ON (f1.film_id = f2.film_id) AND (f1.actor_id <> f2.actor_id);


-- 8. Get all pairs of customers that have rented the same film more than 3 times.      BONUS





-- 9. For each film, list actor that has acted in more films.           BONUS




