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
			SELECT 
                CONCAT(customer.first_name,' ', customer.last_name) AS Name,
                IF(COUNT(rental.rental_id) = 0, 0, COUNT(rental.rental_id)) AS Rental
			FROM
				customer
			LEFT JOIN
				rental
			ON 
				customer.customer_id = rental.customer_id
			WHERE 
				customer.customer_id = p_customer_id
			GROUP BY 
				customer.customer_id, customer.first_name, customer.last_name;
END $$
DELIMITER ;

CALL sp_total_rentals_cliente('10')


-- 3. -

DELIMITER $$

CREATE PROCEDURE sp_inserir_filme_simplificado (
  IN p_title VARCHAR(255),
  IN p_description TEXT,
  IN p_release_year YEAR,
  IN p_language_id INT,
  IN p_rental_rate DECIMAL(4,2),
  IN p_replacement_cost DECIMAL(5,2)
)
BEGIN
  INSERT INTO film (
    title, description, release_year, language_id, rental_duration, rental_rate, 
    replacement_cost, rating, last_update
  )
  VALUES (
    p_title, p_description, p_release_year, p_language_id, 3, p_rental_rate, 
    p_replacement_cost, 'G', NOW()
  );
  SELECT LAST_INSERT_ID() AS film_id;

END$$
DELIMITER ;


-- 4. -

CREATE TABLE payment_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  payment_id INT NOT NULL,
  old_amount DECIMAL(5,2) NOT NULL,
  new_amount DECIMAL(5,2) NOT NULL,
  change_date DATETIME NOT NULL,
  operation VARCHAR(20) NOT NULL
);

DELIMITER $$

CREATE TRIGGER tr_payment_amount_update
BEFORE UPDATE ON payment
FOR EACH ROW
BEGIN
  IF OLD.amount <> NEW.amount THEN
    INSERT INTO payment_audit (
      payment_id, old_amount, new_amount, change_date, operation
    )
    VALUES (
      OLD.payment_id, OLD.amount, NEW.amount, NOW(), 'UPDATE'
    );
  END IF;
  
END$$
DELIMITER ;
