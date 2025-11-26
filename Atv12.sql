--TO FAZENDO AINDA POR ISSO NAO TA CORRETO, só a 1° a 2° ta no caminho 
-- TAREFAS DE PROCEDURE NO MYSQL

-- 1.

DELIMITER $$

CREATE PROCEDURE sp_filmes_por_categoria(IN p_category_name VARCHAR(25))
BEGIN
	SELECT film.film_id, film.title, film.release_year 
    FROM film INNER JOIN 
    film_category 
    ON 
    film.film_id = film_category.film_id 
    INNER JOIN category 
    ON 
    film_category.category_id = category.category_id
    WHERE 
    category.name = p_category_name 
    ORDER BY 
    film.title;
END $$

DELIMITER ;

call sp_filmes_por_categoria('Action')


-- 2.


DELIMITER $$

CREATE PROCEDURE sp_total_rentals_cliente(IN p_customer_id INT)
BEGIN
	DECLARE retorno VARCHAR(100);
	SET retorno =
		CASE 
		WHEN rental_id <= 1 THEN (
			SELECT 
				first_name, last_name, COUNT(rental_id) AS count
			FROM
				customer
			INNER JOIN
				rental
			ON 
				customer.customer_id = rental.customer_id
			RETURN CONCAT(customer.first_name,' ', customer.last_name, count)
            );
			ELSE '0'
		END;
    RETURN retorno;
END $$

DELIMITER ;

call sp_total_rentals_cliente('10')
