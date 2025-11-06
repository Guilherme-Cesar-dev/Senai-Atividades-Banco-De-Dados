--Uso do INNER JOIN

-- 1. Listar todos os pedidos com nome do cliente e vendedor

SELECT 
	Pedidos.PedidoID,
	Clientes.Nome AS Cliente,
	Vendedores.Nome AS Vendedor
FROM 
	Pedidos 
INNER JOIN 
	Clientes ON 
	Pedidos.ClienteID = Clientes.ClienteID
INNER JOIN 
	Vendedores 
ON
	Pedidos.VendedorID = Vendedores.VendedorID

-- 2. Listar os produtos vendidos em cada pedido

SELECT 
	Produtos.Nome,
    	Produtos.ProdutoID,
    	ItensPedido.PedidoID,
    	ItensPedido.Quantidade,
    	Produtos.Preco
FROM 
	ItensPedido
INNER JOIN  
Produtos
ON 
ItensPedido.ProdutoID = Produtos.ProdutoID

-- 3. Listar pedidos realizados por clientes da cidade de Recife

SELECT 
	Clientes.ClienteID,
    	Clientes.Nome,
    	Clientes.Cidade,
    	Pedidos.PedidoID,
    	Pedidos.DataPedido
FROM 
	Pedidos 
INNER JOIN  
	Clientes
ON
Pedidos.ClienteID = Clientes.ClienteID
WHERE 
Cidade = 'Recife'

-- 4. Mostrar os pedidos realizados por vendedores do setor Moda.

SELECT 
	Vendedores.VendedorID,
	Vendedores.Nome,
	Vendedores.Setor,
    Pedidos.PedidoID
FROM 
	Vendedores
INNER JOIN  
	Pedidos
ON 
	Vendedores.VendedorID = Pedidos.VendedorID
WHERE 
	Setor = 'Moda'

-- 5. Exibir os produtos da categoria Eletrônicos que já foram vendidos

SELECT 
	Produtos.Nome,
	Produtos.Categoria,
	Produtos.Preco,
    Produtos.ProdutoID,
	ItensPedido.Quantidade
FROM 
	 Produtos
INNER JOIN  
	ItensPedido 
ON
Produtos.ProdutoID = ItensPedido.ProdutoID
WHERE
Categoria = 'Eletrônicos'

-- 6.  Mostrar pedidos feitos pelos clientes entre 2025-10-12 e 2025-10-18.

SELECT 
  pedidos.PedidoID,
  pedidos.DataPedido,
  clientes.Nome,
  clientes.Cidade,
  clientes.UF
FROM 
  pedidos INNER JOIN clientes
  ON
    pedidos.ClienteID = clientes.ClienteID
        
WHERE 
  pedidos.DataPedido BETWEEN '2025-10-12' AND '2025-10-18'
ORDER BY
  Pedidos.PedidoID


-- 7. Listar os produtos vendidos por vendedores do setor Informática

SELECT 
	Produtos.Nome,
	Vendedores.Nome,
    Vendedores.Setor
FROM 
	ItensPedido
INNER JOIN  
	Produtos
ON 
	ItensPedido.ProdutoID  = Produtos.ProdutoID 
INNER JOIN  
	Pedidos
ON 
	ItensPedido.PedidoID  = Pedidos.PedidoID 
INNER JOIN
	Vendedores
ON
	Pedidos.VendedorID = Vendedores.VendedorID
WHERE 
	Vendedores.Setor = 'Informática'

-- 8. Mostrar pedidos que incluíram o produto Camisa Polo

SELECT 
	Produtos.Nome,
    Pedidos.PedidoID,
    Pedidos.DataPedido
FROM 
	Produtos
INNER JOIN  
	 ItensPedido
ON 
	ItensPedido.ProdutoID = Produtos.ProdutoID 
INNER JOIN  
	Pedidos
ON 
	ItensPedido.PedidoID = Pedidos.PedidoID
WHERE 
	Produtos.Nome = 'Camisa Polo'

-- 9. Exibir pedidos realizados por clientes da Paraíba (PB)

SELECT 
	Clientes.UF,
    Clientes.ClienteID,
    Pedidos.PedidoID,
    Pedidos.DataPedido
FROM 
	Clientes
INNER JOIN  
	Pedidos
ON 
	Clientes.ClienteID = Pedidos.ClienteID  
INNER JOIN  
	ItensPedido
ON 
	Pedidos.PedidoID = ItensPedido.PedidoID
WHERE 
	Clientes.UF = 'PB'

-- 10. Mostrar os produtos vendidos

SELECT 
	Produtos.Nome,
	ItensPedido.ProdutoID,
	ItensPedido.PedidoID,
	ItensPedido.Quantidade,
    Produtos.Preco
FROM 
	ItensPedido
INNER JOIN  
	Pedidos
ON 
	ItensPedido.PedidoID = Pedidos.PedidoID  
INNER JOIN  
	Produtos
ON 
	ItensPedido.ProdutoID = Produtos.ProdutoID

