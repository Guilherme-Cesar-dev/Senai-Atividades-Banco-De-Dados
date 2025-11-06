-- 1. Liste todas as vendas da Loja Centro, mostrando as colunas id_venda, vendedor, produto, quantidade e valor_total, ordenadas pelo valor_total em ordem decrescente.

SELECT  
	id_venda, vendedor, produto, quantidade, valor_total
FROM  
	vendas
WHERE
	loja = 'Loja Centro'
ORDER BY 
	valor_total DESC

-- 2. Exiba as vendas cujo valor_total seja maior que 2000, mostrando data_venda, vendedor, produto e valor_total, ordenadas pela data mais recente.

SELECT  
	data_venda, vendedor, produto, valor_total
FROM  
	vendas
WHERE
	valor_total > 2000
ORDER BY 
	data_venda DESC

-- 3. Mostre todas as vendas feitas por Pix, exibindo id_venda, vendedor, forma_pagamento, valor_total e regiao, ordenadas por vendedor.

SELECT  
	id_venda, vendedor, forma_pagamento, valor_total, regiao
FROM  
	vendas
WHERE
	forma_pagamento = 'Pix'
ORDER BY 
	vendedor 

-- 4. Liste as vendas da categoria “Eletrônicos” com quantidade maior que 1, mostrando produto, quantidade e valor_total, ordenadas pelo produto.

SELECT  
	produto, quantidade, valor_total
FROM  
	vendas
WHERE
	 categoria = 'Eletrônicos' AND quantidade > 1
ORDER BY 
	produto

-- 5. Selecione as vendas realizadas entre 1º de março e 30 de junho de 2025, mostrando data_venda, vendedor, loja, valor_total, em ordem crescente de data.

SELECT  
	data_venda, vendedor, loja, valor_total
FROM  
	vendas
WHERE
	data_venda > '2025-03-01' AND data_venda < '2025-06-30'
ORDER BY 
	data_venda

-- 6. Exiba todas as vendas da região PE com forma de pagamento “Crédito”, mostrando vendedor, produto, quantidade, valor_total e ordenando por valor_total decrescente.

SELECT  
	vendedor, produto, quantidade, valor_total
FROM  
	vendas
WHERE
	regiao = 'PE' AND forma_pagamento = 'Crédito'
ORDER BY 
	valor_total DESC

-- 7. Liste as vendas com quantidade entre 2 e 4 unidades, mostrando id_venda, produto, quantidade, valor_unitario e valor_total, ordenadas por quantidade e depois por produto.

SELECT  
	id_venda, produto, quantidade, valor_unitario, valor_total
FROM  
	vendas
WHERE
	quantidade BETWEEN 2 AND 4
ORDER BY 
	quantidade, produto

-- 8. Mostre as vendas da categoria “Calçados” ou “Vestuário”, exibindo produto, categoria, quantidade e valor_total, ordenadas pelo valor_total crescente.

SELECT  
	produto, categoria, quantidade, valor_total
FROM  
	vendas
WHERE
	categoria IN ('Calçados', 'Vestuário')
ORDER BY 
	valor_total

-- 9. Exiba apenas as vendas feitas pelos vendedores “Ana Lima” e “Carlos Souza”, mostrando data_venda, vendedor, produto, valor_total, ordenadas por data e valor_total.

SELECT  
	data_venda, vendedor, produto, valor_total
FROM  
	vendas
WHERE
	vendedor IN ('Ana Lima', 'Carlos Souza')
ORDER BY 
	data_venda, valor_total

-- 10. Mostre as vendas com valor_unitario inferior a 200 e pagamento em dinheiro, exibindo produto, quantidade, valor_unitario, forma_pagamento e ordenadas pelo produto.

SELECT
    produto, quantidade, valor_unitario, forma_pagamento
FROM
    vendas
WHERE 
    valor_unitario < 200 AND forma_pagamento = 'Dinheiro'
ORDER BY 
    produto