SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'ecommerce';

-- 1) Quantos pedidos foram feitos por cada cliente? 

SELECT c.idClient, CONCAT(c.fname, ' ', c.lname) AS client_name, COUNT(o.idOrder) AS order_count
FROM client c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, client_name; 
         -- R: Foram feitas 1 pedido por cliente

-- 2) Algum vendedor também é fornecedor?

SELECT p.idProduct, p.Pname AS product_name, s.idSupplier, s.SocialName AS supplier_name, ps.quantity AS product_quantity, sl.idLStorage, sl.location AS storage_location
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier
INNER JOIN storageLocation sl ON p.idProduct = sl.idLProduct;
         -- R: Todos os vendendores são fornecedores

-- 3) Relação de produtos fornecedores e estoques?

SELECT p.Pname AS product_name, s.SocialName AS supplier_name, sl.location AS storage_location
FROM product p
INNER JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier
INNER JOIN storageLocation sl ON p.idProduct = sl.idLProduct;
        -- R: Cada fornecedor fornece tem um  tipo de produto

-- Relação de nomes dos fornecedores e nomes dos produtos?

SELECT s.SocialName AS supplier_name, p.Pname AS product_name
FROM supplier s
INNER JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
INNER JOIN product p ON ps.idPsProduct = p.idProduct;
         -- R: Cada fornecedor corresponde a um tipo de produto