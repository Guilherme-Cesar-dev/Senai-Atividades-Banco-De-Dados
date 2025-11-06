-- Uso de DML Inserts

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Clientes (id_cliente, nome, email, cidade) VALUES
(1, 'lucas', 'lucas@gmail.com', 'recife'),
(2, 'jorge', 'jorge@gmail.com', 'jaboatao'),
(3, 'gustavo', 'gustavo@gmail.com', 'piedade'),
(4, 'rafael', 'rafa@gmail.com', 'pacheco'),
(5, 'antonio', 'antonio@gmail.com', 'lunala');

INSERT INTO Pedidos (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(1, 1, '2025-01-12', 14),
(2, 2, '2025-02-12', 40),
(3, 3, '2025-03-12', 29),
(4, 4,'2025-04-12', 13),
(5, 5, '2025-05-12', 12);

ALTER TABLE Clientes ADD column telefone VARCHAR(11);

UPDATE Clientes SET telefone = '9956172899' WHERE id_cliente = 1; 
UPDATE Clientes SET telefone = '9924758799' WHERE id_cliente = 2; 
UPDATE Clientes SET telefone = '9993876539' WHERE id_cliente = 3; 
UPDATE Clientes SET telefone = '9999298349' WHERE id_cliente = 4; 
UPDATE Clientes SET telefone = '9999967859' WHERE id_cliente = 5; 