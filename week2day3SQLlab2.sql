-- InstructionsInstructions
use sakila;

-- In the table actor, which are the actors whose last names are not repeated?

select *, count(first_name) as cnt from actor
group by last_name
HAVING cnt = 1;

-- 1. Which last names appear more than once? 
-- We would use the same logic as in the previous question 
-- but this time we want to include the last names of the actors where the last name was present more than once
select last_name, count(first_name) as cnt from actor
group by last_name
HAVING cnt <>1;

-- 2. Using the rental table, find out how many rentals were processed by each employee. REVISE
SELECT Staff_id, COUNT(rental_id) as "number of rentals per employee" from rental
Group by staff_id;

-- 3. Using the film table, find out how many films were released each year.
SELECT release_year, count(title) from film
Group by release_year;

-- 4. Using the film table, find out for each rating how many films were there.
SELECT rating, count(distinct(title)) AS 'number of films per rating' FROM film
GROUP BY rating
ORDER BY 'number of films per rating';

-- 5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.

SELECT rating, ROUND(AVG(length),2) as "average length" from film
GROUP by  rating;

-- 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length),2) as "average length" from film
GROUP by  rating;

-- 6. Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

SELECT length, title, 
RANK() OVER   
    (ORDER BY length ASC) AS "Rank"  
from film
WHERE length <> ' ';


