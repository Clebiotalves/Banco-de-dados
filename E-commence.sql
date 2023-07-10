-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients (
		idClient int auto_increment primary key,
        Fname varchar(10),
        Mint char(3),
        Lname varchar(20),
        CPF char(11)not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)        
);
-- criar tabela produto

-- size = dimensão do produto
create table product (
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        Classification_Kids bool default false,
        category enum('Eletrônico','Vestimenra','Brinquedos','Alimneto','Móveis') not null,
        avaliação float default 0,
        size varchar(10)             
);

-- criar tabela pagamento

-- para ser continuando no desafio :termine de implementar a tabela e crie a conexão com as tabelas necessárias

-- além disso, reflita essa modificação no diagrama de esquema relacional

-- criar constraints relacionados aos pagamentos
 create table payments(
		idclient int ,
        id_payment int,
        typePayment enum('Boleto','Cartão','Dois cartões'),
        limitAvailable float,
        primary key(idClient, id_paymnet)
);
 
-- criar tabela pedido
create table orders(
		idOrders int auto_increment primary key,
        idOrderClient int,        
        orderStatus enum('Cancelado','Confirmado','Em processamento') default'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,  
        paymentcash bool default false,
        constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
);

-- criar tabela estoque
create table productStorage(
    idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ cahr(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar tabela relacionamento Produto e Vendedor
create table productSeller(
    idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idSeller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProdut) references product(idProduct)
);

-- criar tabela relacionamento Produto e Pedido
create table productOrder(
    idPOproduct int,
    idPOorder int,
    podQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key(idPOproduct, idPOorder),
    constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

-- criar tabela relacionamento Estoque e Produto
create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

--- criar tabela relacionamento Fornecedor e Produto
create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity in not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_suplier foreign key (idPsSupplier) references supplier(idPsSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idPsProduct)
);