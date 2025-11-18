-- 1) [CREATE VIEW] Crie uma VIEW chamada vw_clientes_ativos que mostre apenas os clientes com ativo = 1, exibindo as colunas:
-- id, nome, email, cidade e data_cadastro.

CREATE VIEW vw_clientes_ativos AS 
SELECT
	id,
    nome,
    email,
    cidade,
    data_cadastro
FROM 
	clientes
WHERE 
	ativo = 1

-- 2) [ALTER VIEW] A VIEW vw_clientes_ativos atualmente mostra apenas os clientes ativos.
-- Altere essa VIEW para também exibir a coluna cpf no resultado.

ALTER VIEW vw_clientes_ativos AS 
SELECT
	id,
    nome,
    email,
    cpf,
    cidade,
    data_cadastro
FROM 
	clientes
WHERE 
	ativo = 1

-- 3) [CREATE INDEX] Na tabela clientes, as consultas mais frequentes usam filtro pela coluna email.
-- Crie um índice simples nessa coluna para melhorar o desempenho dessas consultas.

CREATE INDEX clientes_email ON clientes(email)

-- 4) [CREATE INDEX] Na tabela pedidos, as consultas do sistema geralmente filtram os registros pela coluna data_pedido.
-- Crie um índice simples na coluna data_pedido.

CREATE INDEX pedidos_data ON pedidos(data_pedido)

-- 5) [CREATE INDEX] Na tabela produtos, o sistema lista com frequência os produtos filtrando pela coluna categoria.
-- Crie um índice simples na coluna categoria para otimizar essas consultas.

CREATE INDEX produtos_categoria ON produtos(categoria)

-- 6) [CREATE UNIQUE INDEX] Na tabela clientes, a coluna cpf não deve aceitar valores repetidos, pois cada CPF identifica um cliente único.
-- Crie um índice UNIQUE na coluna cpf para garantir essa regra.

CREATE UNIQUE INDEX clientes_cpf ON clientes(cpf)

-- 7) [CREATE INDEX - COMPOSTO] A tabela pedidos é muito consultada filtrando pelo status e ordenando pela data_pedido.
-- Crie um índice composto envolvendo as colunas status e data_pedido para otimizar esse tipo de consulta.

CREATE INDEX pedidos_status_data ON pedidos(status, data_pedido) 

-- 8) [DROP INDEX] Suponha que foi criado um índice chamado idx_clientes_cidade na tabela clientes, apenas para testes.
-- Após análise, verificou-se que ele é desnecessário.

DROP INDEX idx_clientes_cidade ON clientes

