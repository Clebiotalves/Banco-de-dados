-- show  tables;
-- Inserir dados da tabela client
-- desc client;
insert into client (fname, minit, lname, cpf, data_nascimento)
values
    ('John', 'D.', 'Doe', '12345678901', '1990-05-10'),
    ('Jane', 'M.', 'Smith', '98765432109', '1995-12-18'),
    ('David', 'L.', 'Johnson', '45678901234', '1987-08-27'),
    ('Emily', 'R.', 'Williams', '56789012345', '1992-03-15'),
    ('Michael', 'J.', 'Brown', '65432109876', '1985-11-02');
    
-- Inserir dados da tabela endereço
-- desc address;
insert into address (idClient, typeAddress, zipCode, street, country)
values
    (1, 'Residential', '12345-678', '123 Main St', 'USA'),
    (2, 'Business', '98765-432', '456 Elm St', 'USA'),
    (3, 'Residential', '56789-012', '789 Oak St', 'USA'),
    (4, 'Business', '54321-098', '987 Maple St', 'USA'),
    (5, 'Residential', '65432-109', '321 Pine St', 'USA');

-- Inserir dados da tabela produtos
-- desc produtos;
insert into product (Pname, Classification_Kids, category, avaliação, size)
values
    ('Smartphone', 0, 'Eletrônico', 4.5, '6 inches'),
    ('T-shirt', 1, 'Vestimenta', 0, 'M'),
    ('Toy Car', 1, 'Brinquedos', 0, 'Medium'),
    ('Chocolate Bar', 1, 'Alimento', 0, 'N/A'),
    ('Chair', 0, 'Móveis', 0, 'Standard');
    
-- desc orders;
-- Inserir dados da tabela ordem de pedido
insert into orders (idOrderClient, order_status, order_description, send_value, paymentCash, idPayment)
values
    (1, 'Confirmado', 'Order 1 description', 8.5, 0, 1),
    (2, 'Confirmado', 'Order 2 description', 10.0, 0, 2),
    (3, 'Em processamento', 'Order 3 description', 12.0, 0, 3),
    (4, 'Em processamento', 'Order 4 description', 9.99, 0, 4),
    (5, 'Confirmado', 'Order 5 description', 15.75, 0, 5);
    
-- Inserir dados da tabela  Pagamentos
-- desc payments;
insert into payments (idClient, typePayment, totalPrice, paymentStatus, limitAvalilable)
values
    (1, 'Cartão', 150.0, 'Autorizado', 500.0),
    (2, 'Pix', 75.5, 'Processando', 200.0),
    (3, 'boleto', 99.99, 'Não Autorizado', 150.0),
    (4, 'Cartão', 120.0, 'Processando', 300.0),
    (5, 'Dois cartão', 200.0, 'Autorizado', 400.0);

-- Inserir dados da tabela  cartão de credito
-- desc creditCard;
insert into creditCard (idPayment, credCardFlag, cardNumber, expirationDate, cardHolderName, securityCode)
values
    (1, 'Visa', '1234567890123456', '2025-12-31', 'John Doe', '123'),
    (2, 'Mastercard', '9876543210987654', '2023-10-31', 'Jane Smith', '456'),
    (3, 'Amex', '4567890123456789', '2024-06-30', 'David Johnson', '789'),
    (4, 'Visa', '5678901234567890', '2022-08-31', 'Emily Williams', '012'),
    (5, 'Mastercard', '6543210987654321', '2023-05-31', 'Michael Brown', '345');

-- Inserindo dados da tabela Pix
-- desc cash;
insert into cash (idPayCash, typePix, Pix)
values
    (1, 'CPF', '12345678901'),
    (2, 'E-mail', 'jane.smith@example.com'),
    (3, 'Telefone', '+1234567890'),
    (4, 'CPF', '56789012345'),
    (5, 'E-mail', 'michael.brown@example.com');

-- Inserir dados da tabela Boleto
-- des ticket;
insert into ticket (idPayTicket, bankName, barCode, dueDate)
values
    (1, 'Bank A', '12345678901234567890123456789012345678901234567', '2023-07-31'),
    (2, 'Bank B', '98765432109876543210987654321098765432109876543', '2023-08-15'),
    (3, 'Bank C', '45678901234567890123456789012345678901234567890', '2023-09-01'),
    (4, 'Bank D', '56789012345678901234567890123456789012345678901', '2023-09-15'),
    (5, 'Bank E', '65432109876543210987654321098765432109876543210', '2023-10-01');

-- Inserir dados da tabela Estoque
-- desc productStorage;
insert into productStorage (storageLocation, quantity)
values
    ('Warehouse A', 100),
    ('Warehouse B', 50),
    ('Warehouse C', 200),
    ('Warehouse A', 75),
    ('Warehouse B', 30);

-- Inserir dados da tabela Vendedor
-- desc supplier;
insert into supplier (socialName, CNPJ, contact)
values
    ('Supplier Company A', '12345678901234', '9876543210'),
    ('Supplier Company B', '56789012345678', '1234567890'),
    ('Supplier Company C', '90123456789012', '5678901234'),
    ('Supplier Company D', '34567890123456', '9012345678'),
    ('Supplier Company E', '78901234567890', '3456789012');

-- Inserir dados da tabela Fornecedor
-- desc seller;
insert into seller (socialName, abstName, CNPJ, CPF, location, contact)
values
    ('Seller Company A', 'Seller A', '12345678901234', '123456789', 'Office 1A', '9876543210'),
    ('Seller Company B', 'Seller B', '56789012345678', '234567890', 'Office 2B', '1234567890'),
    ('Seller Company C', 'Seller C', '90123456789012', '345678901', 'Office 3C', '5678901234'),
    ('Seller Company D', 'Seller D', '34567890123456', '456789012', 'Office 4D', '9012345678'),
    ('Seller Company E', 'Seller E', '78901234567890', '567890123', 'Office 5E', '3456789012');

-- Inserir dados da tabela produto de fornecedor
-- desc productSeller;
insert into productSeller (idSeller, idProduct, prodQuantity)
values
    (1, 1, 10),
    (2, 2, 20),
    (3, 3, 15),
    (4, 4, 12),
    (5, 5, 8);

-- Inserir dados da tabela ordem de produto
-- desc productOrder;
insert into productOrder (idPOrder, idPOProduct, poQuantity, poStatus)
values
    (1, 1, 2, 'Disponível'),
    (2, 2, 1, 'Sem estoque'),
    (3, 3, 3, 'Disponível'),
    (4, 4, 0, 'Sem estoque'),
    (5, 5, 4, 'Disponível');

-- Inserir dados da tabela localização do produto
-- desc storageLocation
insert into storageLocation (idLProduct, idLStorage, location)
values
    (1, 1, 'Warehouse A'),
    (2, 2, 'Warehouse B'),
    (3, 3, 'Warehouse C'),
    (4, 4, 'Warehouse A'),
    (5, 5, 'Warehouse B');

-- Inserir dados da tabela produto produto vendedor
-- desc productSupplier;
insert into productSupplier (idPSSupplier, idPSProduct, quantity)
values
    (1, 1, 50),
    (2, 2, 30),
    (3, 3, 40),
    (4, 4, 25),
    (5, 5, 35);