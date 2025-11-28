-- ATIVIDADE PRA MECHER NOS USUARIOS DO MYSQL

-- 1.

CREATE USER 'leitor_sakila'@'localhost'IDENTIFIED BY 'read@123';
GRANT SELECT ON sakila.actor TO 'leitor_sakila'@'localhost' 

19:44:42	INSERT INTO actor (first_name, last_name) VALUES ('JULIO', 'VERNE')	Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.	0.016 sec

DEU ERRO PELA FALTA DE PERMISSÃO DO USUÁRIO ‘leitor_sakila’ USAR O COMANDO INSERT


-- 2. 

CREATE USER 'operador_sakila'@'localhost'IDENTIFIED BY 'oper@2025';
GRANT INSERT, UPDATE ON sakila.rental TO 'leitor_sakila'@'localhost' 

19:53:09	DELETE rental_id FROM rental WHERE  rental_id > 10	Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.	0.000 sec

DEU ERRO PELA FALTA DE PERMISSÃO DO USUÁRIO ‘operador_sakila’ USAR O COMANDO DELETE


-- 3.

REVOKE DELETE ON sakila.rental FROM 'operador_sakila'@'localhost'
INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES 
('1', NOW(), '367', '130', '2025-11-27 22:04:30', '1', NOW())


-- 4.

CREATE USER 'gestor_sakila'@'localhost'IDENTIFIED BY 'gestor@2025';

GRANT SELECT ON sakila.inventory TO 'gestor_sakila'@'localhost' WITH GRANT OPTION

– gestor_sakila
GRANT SELECT ON sakila.inventory TO 'leitor_sakila'@'localhost'

WITH GRANT OPTION DA PERMISSÃO A UM USUARIO PARA ELE REPASSAR PERMISSÃO DE COMANDO A OUTROS USUÁRIOS


-- 5.

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'leitor_sakila'@'localhost';
DROP USER 'leitor_sakila'@'localhost'

REVOGAR PRIVELIGOS É LIMPAR CODIGOS EXPECIFICOS ENQUANTO O REVOKE USER REMOVE UM USUARIO DO SISTEMA
