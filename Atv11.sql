-- ATIVIDADE PARA APLICAR FUNÇÕES NO MYSQL

-- 1.

DELIMITER $$

CREATE FUNCTION fn_nome_completo_cliente(
		p_customer_id INT,
		p_first_name VARCHAR(45),
		p_last_name VARCHAR(45)
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE nome_completo VARCHAR(100);
	SET nome_completo = CONCAT(LOWER(p_first_name),' ',UPPER(p_last_name), '[', p_customer_id, ']');
    RETURN nome_completo;
END $$

DELIMITER ;

SELECT * FROM fn_nome_completo_cliente(11, mario, lucas)

-- 2.

DELIMITER $$

CREATE FUNCTION fn_valor_estimado_locacao(
	p_rental_duration INT,
	p_rental_rate DECIMAL(4,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE Calculo DECIMAL(10,2);
    SET Calculo = p_rental_duration * p_rental_rate;
	RETURN Calculo;
END $$
DELIMITER ;

SELECT 
	film_id,
	title,
	rental_duration,
	rental_rate,
    fn_valor_estimado_locacao(rental_duration,rental_rate) AS valor_estimado
FROM
	film
WHERE
	  fn_valor_estimado_locacao(rental_duration,rental_rate) > '10.00'

-- 3.

DELIMITER $$

CREATE FUNCTION  fn_classifica_duracao(
	p_length INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE retorno VARCHAR(20);
    SET retorno =
		CASE
			WHEN p_length <= '60' THEN 'CURTO'
			WHEN p_length < '120' THEN 'MEDIO'
			WHEN p_length >='120' THEN 'LONGO'
			ELSE 'SEM DADOS'
		END;
	RETURN retorno;
END $$
DELIMITER ;

SELECT 
	film_id,
	title,
	length,
	rental_rate,
    fn_classifica_duracao(length) AS categoria_duracao
FROM
	film
