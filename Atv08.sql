
-- Atividade de sql usando o Banco de Dados 'sakila' do Mysql, ele representa uma locadora de filmes

-- 1. Filmes e suas categorias 
-- Liste o título do filme, o nome da categoria e a descrição do filme.
-- Ordene pelo nome da categoria e depois pelo título do filme.

SELECT
	film.title,
  category.name,
  film.description
FROM
	film 
INNER JOIN
	film_category
ON 
	film.film_id = film_category.film_id
INNER JOIN 
	category
ON
	category.category_id = film_category.category_id
ORDER BY
	category.name, film.title

-- 2. Clientes e suas cidades
-- Mostre o nome completo do cliente (first_name + last_name) e o nome da cidade onde ele mora.

SELECT
	CONCAT(
		customer.first_name,
		customer.last_name
  ) AS name,
	city.city
FROM
	customer
INNER JOIN
	address
ON
	customer.address_id = address.address_id
INNER JOIN
	city
ON
	address.city_id = city.city_id
    
-- 3. Funcionários e suas lojas
-- Exiba o nome do funcionário, o ID da loja em que trabalha e o endereço dessa loja.

SELECT
	staff.first_name,
	staff.last_name,
  store.store_id,
  address.address
FROM
	staff
INNER JOIN
	store
ON 
	staff.store_id = store.store_id
INNER JOIN
	address
ON
	staff.address_id = address.address_id

-- 4. Filmes alugados por clientes
-- Liste o nome do cliente, o título do filme e a data de aluguel (rental_date).
-- Mostre apenas os alugueis feitos após 1º de janeiro de 2006.

SELECT
  CONCAT(
		customer.first_name,
		customer.last_name
  ) AS name,
  film.title,
  rental.rental_date
FROM
	customer
INNER JOIN
	rental
ON 
	customer.customer_id = rental.customer_id
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film 
ON
	film.film_id = inventory.film_id
WHERE
	rental_date > '2006-01-01'

-- 5. Clientes que fizeram pagamentos acima de 5 dólares
-- Liste o nome do cliente, o valor do pagamento e a data do pagamento para pagamentos maiores que 5.00.
-- Ordene pelo valor decrescente.

SELECT
	CONCAT(
		customer.first_name,
		customer.last_name
	) AS name,
	payment.amount,
  payment.payment_date
FROM
	customer
INNER JOIN
	payment
ON 
	customer.customer_id = payment.customer_id
WHERE
	payment.amount > '5.00'
ORDER BY 
	payment.amount DESC

-- 6. Filmes de uma determinada categoria
-- Mostre o título e o ano de lançamento dos filmes que pertencem à categoria “Action”.

SELECT
	film.title,
  film.release_year
FROM
	film
INNER JOIN
	film_category
ON 
	film.film_id = film_category.film_id
INNER JOIN
	category
ON 
	category.category_id = film_category.category_id
WHERE
	category.name = 'Action'

-- 7. Endereços de clientes
-- Liste o nome do cliente, o endereço completo (address + district + city),
-- apenas para clientes que vivem nos Estados Unidos.

SELECT
	CONCAT(
		customer.first_name,
		customer.last_name
	) AS name,
  CONCAT( 
		address.address, 
		address.district, 
		city.city
  ) as endereço,
    country.country
FROM
	customer
INNER JOIN
	address
ON 
	customer.address_id = address.address_id
INNER JOIN
	city
ON 
	address.city_id = city.city_id
INNER JOIN
	country
ON 
	city.country_id = country.country_id
WHERE
	country.country = 'United States'

-- 8. Filmes disponíveis em uma loja específica
-- Mostre o título do filme, o ID do inventário e o ID da loja para os filmes disponíveis na loja de store_id = 1.

SELECT
	film.title,
    inventory.inventory_id,
    store.store_id
FROM
	film
INNER JOIN
	inventory
ON 
	film.film_id = inventory.film_id
INNER JOIN
	store
ON 
	inventory.store_id = store.store_id
WHERE
	store.store_id = '1'

-- 9. Pagamentos feitos por meio de qual funcionário
-- Liste o nome do cliente, o nome do funcionário que processou o pagamento e o valor pago.

SELECT
	CONCAT(
		customer.first_name,
        ' ',
		customer.last_name
	) AS customer_name,
    CONCAT(
		staff.first_name,
        ' ',
		staff.last_name
	) AS staff_name,
    payment.amount
FROM
	customer
INNER JOIN
	payment
ON 
	customer.customer_id = payment.customer_id
INNER JOIN
	staff
ON 
	payment.staff_id = staff.staff_id
  
-- 10. Aluguéis devolvidos com atraso
-- Liste o nome do cliente, o título do filme, a data de devolução e a data de aluguel 
-- apenas para os casos em que a devolução ocorreu mais de 5 dias após o aluguel.

SELECT
	CONCAT(
		customer.first_name, ' ',
		customer.last_name
	) AS name,
    film.title,
    rental.rental_date,
    rental.return_date
FROM
	customer
INNER JOIN
	rental
ON 
	customer.customer_id = rental.customer_id
INNER JOIN
	inventory
ON 
	rental.inventory_id = inventory.inventory_id
INNER JOIN
	film
ON
	inventory.film_id = film.film_id
WHERE
	DATE_ADD(rental.rental_date, INTERVAL 5 DAY) < rental.return_date
